require 'geckoboard'


class DataPusher
  API_KEY = ENV['GECKOBOARD_API']

  attr_reader :client

  def initialize
    @client = Geckoboard.client(API_KEY)
    @dataset
  end

  def delete_dataset(currency)
    client.datasets.delete('btc_to_' + currency + '.by_5_minutes')
  end

  def target_dataset(currency)
    @dataset = client.datasets.find_or_create('btc_to_' + currency + '.by_5_minutes', fields: {
      'last':{
        "type": "money",
        "name": currency,
        "currency_code": currency.upcase
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
