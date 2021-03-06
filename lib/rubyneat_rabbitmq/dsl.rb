# -*- coding: utf-8 -*-
=begin rdoc
DSL for handling RabbitMQ
=end

module NEAT
  module DSL
    def rabbit(&block)
      def config(&block)
        @bunny = {}

        def url(u)
          @bunny[:url] = u 
        end

        def queue(*p)
          @bunny[:queue_params] = p
        end
        
        def routing(r)
          @bunny[:routing_key] = r
        end

        def reply_to(*rep)
          @bunny[:reply_params] = rep
        end

        block.(@bunny)
      end

      def worker(&block)
      end

      block.()

      unless @bunny.nil?
        @bunny[:conn] = Bunny.new @bunny[:url]
        @bunny[:conn].start
        @bunny[:channel] = @bunny[:conn].create_channel
        @bunny[:queue] = @bunny[:channel].queue(*@bunny[:queue_params])
        @bunny[:reply] = @bunny[:channel].queue(*@bunny[:reply_params])
        @bunny[:exchange] = @bunny[:channel].default_exchange
        NEAT::controller.bunny = @bunny
      end
    end
  end

  # We monkey patch Controller to put a bunny in there.
  class Controller
    attr_neat :bunny, default: nil, cloneable: false
  end
end
