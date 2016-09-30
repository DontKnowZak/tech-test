require 'data_puller'

describe DataPuller do

  describe '#initialize' do
    context 'when initialized' do
      it 'has an empty datastore array' do
        expect(subject.datastore).to eq []
      end
    end
  end

  describe '#call_api' do
    context 'when called' do
      it 'returns the result of the get request in instance variable' do
        allow(Net::HTTP).to receive(:get).and_return('{"Test":"Hello world!"}')
        expect(subject.call_api).to eq({ 'Test'=>'Hello world!'})
      end
    end
  end

  describe '#format_values' do
    context 'when called' do
      it 'puts the response of the get request into datastore array' do
        time = DateTime.now
        time_iso8601 = time.iso8601
        allow(Net::HTTP).to receive(:get).and_return('{"USD":{"buy":604.25}}')
        allow(DateTime).to receive(:now).and_return(time)
        subject.call_api
        subject.format_values('USD')
        expect(subject.datastore).to eq [{:buy=>60425, :datetime=>time_iso8601}]
      end
    end
  end

end
