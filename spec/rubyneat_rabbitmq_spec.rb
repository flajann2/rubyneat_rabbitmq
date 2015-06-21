require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'rubyneat_rabbitmq'

describe NEAT::Rabbit do
  it 'RabbitMQ installed and running' do
    Bunny::VERSION.should == '1.7.0'

    TMESSAGE = 'Test Message should be received!!!!!'
    gotmessage = nil
    conn = Bunny.new
    conn.start
    
    ch = conn.create_channel
    q  = ch.queue("rubyneat.rspec.test", :auto_delete => true)
    x  = ch.default_exchange
    
    q.subscribe do |delivery_info, metadata, payload|
      gotmessage = payload
    end
    
    x.publish(TMESSAGE, :routing_key => q.name)    
    sleep 0.5
    gotmessage.should_not be_nil
    gotmessage.should == TMESSAGE

    conn.close
  end
end
