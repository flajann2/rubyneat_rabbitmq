require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'rubyneat_rabbitmq'

describe NEAT::Rabbit do
  it 'RabbitMQ installed and running' do
    expect(Bunny::VERSION).to eq('1.7.1')

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
    expect(gotmessage).not_to be_nil
    expect(gotmessage).to eq(TMESSAGE)

    conn.close
  end
end
