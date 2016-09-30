require './lib/data_puller'
require './lib/data_pusher'
require './lib/formatter'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new
@data_pusher = DataPusher.new
@data_puller = DataPuller.new
#Enter below currencies you want to push to a dataset
currencies = ['usd', 'gbp']

scheduler.every '5m' do
  currencies.each do |currency|
    pass_data(currency)
  end
end

private

def pass_data(currency)
  load_formatter(currency)
  @data_puller.call_api
  get_formatter(currency).format_values(currency, @data_puller.call_time, @data_puller.response)
  @data_pusher.target_dataset(currency)
  @data_pusher.push_to_dataset(get_formatter(currency).datastore)
end

def load_formatter(currency)
  formatter = get_formatter(currency)
  if !(formatter)
    set_formatter(currency)
  end
end

def get_formatter(currency)
  instance_variable_get("#{formatter_name(currency)}")
end

def formatter_name(currency)
  formatter_name = "@#{currency}_formatter"
end

def set_formatter(currency)
  instance_variable_set("#{formatter_name(currency)}", Formatter.new)
end

scheduler.join
