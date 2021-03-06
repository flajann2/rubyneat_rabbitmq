require 'rubyneat_rabbitmq'

describe NEAT::Rabbit do
  context 'RabbitMQ' do
    it 'installed and running' do
    end
  end

  context 'DSL' do
    include NEAT::DSL
    URL = 'amqp://guest:guest@localhost:5672'
    bunny = nil 

    it 'configurable' do
      rabbit do
        config do |c|
          bunny = c
          url URL
          queue 'test.queue', auto_delete: true
          routing 'test.route'
          reply_to 'test.reply'
        end
      end
      expect(bunny).not_to be_nil
      expect(bunny[:url]).to be URL
      expect(bunny[:queue_params].first).to eq('test.queue')
      expect(bunny[:reply_params]).to eq(['test.reply'])
      expect(bunny[:routing_key]).to eq('test.route')
      expect(NEAT::controller.bunny).to be bunny
    end
  end
end
