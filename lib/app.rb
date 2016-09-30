require './lib/data_puller'
require './lib/data_pusher'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new
data_pusher = DataPusher.new
data_puller = DataPuller.new

scheduler.every '1h' do
  data_puller.call_api
  data_puller.format_values('usd')
  data_pusher.target_dataset('usd')
  data_pusher.push_to_dataset(data_puller.datastore)
end

scheduler.join
