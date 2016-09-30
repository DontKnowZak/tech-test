require './lib/data_puller'
require './lib/data_pusher'
require './lib/formatter'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new
@data_pusher = DataPusher.new
@data_puller = DataPuller.new

scheduler.every '5m' do
  pass_data('usd')
  pass_data('gbp')
end

private

def pass_data(currency)
  load_formatter(currency)
  @data_puller.call_api
  instance_variable_get("#{formatter_name(currency)}").format_values(currency, @data_puller.call_time, @data_puller.response)
  @data_pusher.target_dataset(currency)
  @data_pusher.push_to_dataset(instance_variable_get("#{formatter_name(currency)}").datastore)
end

def load_formatter(currency)
  formatter = instance_variable_get("#{formatter_name(currency)}")
  if !(formatter)
    instance_variable_set("#{formatter_name(currency)}", Formatter.new)
  end
end

def formatter_name(currency)
  formatter_name = "@#{currency}_formatter"
end

scheduler.join
