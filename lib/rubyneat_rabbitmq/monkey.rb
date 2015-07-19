# -*- coding: utf-8 -*-
=begin rdoc
= Monkey Patches for RubyNEAT

== Synopsis

Not that other files here don't do monkey patching (they do),
but the monkey patches for the core of RubyNEAT are all in this
file.

== Approach

We have thought about whether or not we would bunch up sequence numbers
to be iterated remotely, or to just place each job in the queue to
be processed by the remote workers on a sequence basis. We have
decided to do the latter because of the more granularity this
buys us. Potentially, the same critter with different sequence
numbers can be evaluated simultaneously this way.

This will, of course, incur a lot more entries in the queue, but
overall we deem this to be a more efficient approach, as it will 
keep the remote workers simple, handling one sequence and
critter at a time, returning the results singly.

Alas, this also means more traffic for RubyNEAT itself to handle
on the return vectors, but this should not represent a significantly
higher impact. 

In the case where critters may have to interact, as in a coevolution
situation, then the sequence numbers would or could mediate the group
of critters that would interact.

=end

module NEAT
  class Population
    def evaluate!
      controller.bunny[:queue].subscribe do |dinfo, mdata, payload|
        puts "dinfo=%s mdata=%s payload=%s" % [dinfo, mdata, payload]
      end

      @critters.each { |critter| critter.evaluate! }
    end
  end

  class Evaluator
    # Here, we send the crittter's phenotype
    # down the RabbitMQ hole, but collect
    # the results asynchronously elsewhere.
    def evaluate!(critter)
      vin = controller.query_func_hook(controller.seq_num)
      @crit_hist[critter] = {} unless @crit_hist.member? critter
      begin
        x = controller.bunny[:exchange]
        vout = unless controller.recurrence_func_none?
                 critter.phenotype.activate_critter *vin, &@controller.recurrence_func_hook_itself
               else
                 critter.phenotype.activate_critter *vin
               end
        log.debug "Critter #{critter.name}: vin=#{vin}. vout=#{vout}"
        @crit_hist[critter][controller.seq_num] = [vin, vout]
      rescue Exception => e
        log.error "Exception #{e} on code:\n#{critter.phenotype.code}"
        @crit_hist[critter][controller.seq_num] = [vin, :error]
      end

    end
  end

  class Critter
    class Phenotype
      # This is going to be done remotely, so why do an
      # instance_eval
      def express!
        instance_eval Unparser.unparse @code
        self
      end
    end
  end
end
