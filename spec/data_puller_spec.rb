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

end
