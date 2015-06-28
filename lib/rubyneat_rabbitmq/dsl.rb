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

        def channel(c)
          @bunny[:channel_name] = c
        end

        def queue(*p)
          @bunny[:queue_params] = p
        end
        block.(@bunny)
      end

      def worker(&block)
      end

      block.()

      unless @bunny.nil?
        @bunny[:conn] = Bunny.new @bunny[:url]
        @bunny[:conn].start
        @bunny[:channel] = @bunny[:conn].create_channel @bunny[:channel_name]
        @bunny[:queue] = @bunny[:channel].queue  
      end
    end
  end
end
