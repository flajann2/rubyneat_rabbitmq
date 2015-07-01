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
        
        def route(r)
          @bunny[:routing_key] = r
        end

        def reply_to(rep)
          @bunny[:reply_to] = rep
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
        @bunny[:exchange] = @bunny[:channel].default_exchange
      end
    end
  end
end
