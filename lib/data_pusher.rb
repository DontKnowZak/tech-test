require 'geckoboard'


class DataPusher
  API_KEY = ENV['GECKOBOARD_API']

  attr_reader :client

  def initialize
    @client = Geckoboard.client(API_KEY)
    @dataset
  end

  def delete_dataset
    client.datasets.delete('btc_to_usd.by_15_minute')
  end

  def create_dataset
    @dataset = client.datasets.find_or_create('btc_to_usd.by_15_minute', fields: {
      'buy':{
        "type": "money",
        "name": "Dollars",
        "currency_code": "USD"
      },
      "datetime":{
        "type": "datetime",
        "name": "Datetime"
      }
    })
  end

  def push_to_dataset(data)
    @dataset.put(data)
  end

end
