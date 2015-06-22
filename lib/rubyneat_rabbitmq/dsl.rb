=begin rdoc
DSL for handling RabbitMQ
=end

module NEAT
  module DSL
    def rabbit(&block)
      def config(&block)
        @cfg = OpenStruct.new

        def url(u)
          @cfg.url = u 
        end

        def channel(c)
          @cfg.channel = c
        end

        def queue(*p)
          @cfg.queue = p
        end
        block.(@cfg)
      end

      def worker(&block)
      end
      block.()
    end
  end
end
