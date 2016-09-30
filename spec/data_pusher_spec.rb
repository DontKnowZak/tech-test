require 'data_pusher'

describe DataPusher do

  describe '#initialize' do
    it 'initializes with a working API key' do
      expect(subject.client.ping).to eq true
    end
  end

  describe '#target_dataset' do
    it 'returns a dataset' do
      expect(subject.target_dataset('usd')).to be_instance_of(Geckoboard::Dataset)
    end
  end
end
