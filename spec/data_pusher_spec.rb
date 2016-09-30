require 'data_pusher'

describe DataPusher do

  describe '#initialize' do
    it 'initializes with a working API key' do
      expect(subject.client.ping).to eq true
    end
  end
end
