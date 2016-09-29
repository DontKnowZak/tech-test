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
    @datastore << JSON.parse(response)
  end

end
