require 'formatter'

describe Formatter do

  describe '#format_values' do
    context 'when called' do
      it 'puts the response of the get request into datastore array' do
        time = DateTime.now
        time_iso8601 = time.iso8601
        allow(DateTime).to receive(:now).and_return(time)
        subject.format_values('usd', time_iso8601, {"USD"=>{"last"=>604.25}})
        expect(subject.datastore).to eq [{:last=>60425, :datetime=>time_iso8601}]
      end
    end
  end

end
