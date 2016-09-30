require 'net/http'
require 'json'

class DataPuller

  attr_reader :uri, :url, :response, :call_time

  def initialize
    @url = 'https://blockchain.info/ticker'
    @uri = URI(url)
  end

  def call_api
    response = Net::HTTP.get(uri)
    @call_time = DateTime.now.iso8601
    @response = JSON.parse(response)
  end

end
