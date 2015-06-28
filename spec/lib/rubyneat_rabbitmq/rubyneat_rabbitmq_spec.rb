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
          channel 'test.channel'
          queue 'test.queue', auto_delete: true
        end
      end
      expect(bunny).not_to be_nil
      expect(bunny[:url]).to be URL
      expect(bunny[:queue_params].first).to eq('test.queue')
      expect(bunny[:channel_name]).to eq('test.channel')
    end
  end
end
