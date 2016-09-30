require 'net/http'
require 'json'

class DataPuller

  attr_reader :uri, :datastore, :url

  def initialize
    @datastore = []
    @url = 'https://blockchain.info/ticker'
    @uri = URI(url)
  end

  def call_api
    response = Net::HTTP.get(uri)
    @call_time = DateTime.now.iso8601
    @response = JSON.parse(response)
  end

  def format_values(currency, call_time = @call_time, response = @response)
    @datastore << {
      'last': (response[currency.upcase]['last'] * 100).floor,
      'datetime': call_time
    }
  end

end
