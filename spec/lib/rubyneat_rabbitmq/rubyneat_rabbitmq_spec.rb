require 'rubyneat_rabbitmq'

describe NEAT::Rabbit do
  context 'RabbitMQ' do
    it 'installed and running' do
    end
  end

  context 'DSL' do
    include NEAT::DSL
    URL = 'amqp://guest:guest@localhost:5672'
    it 'configurable' do
      cfg = nil
      rabbit do
        config do |c|
          cfg = c
          url URL
          channel 'test.channel'
          queue 'test.queue', auto_delete: true
        end
      end
      cfg.should_not be_nil
      cfg[:url].should == URL
      cfg[:queue].first.should == 'test.queue'
      cfg[:channel].should == 'test.channel'
    end
  end
end
