class Formatter

  attr_reader :datastore

  def initialize
    @datastore = []
  end

  def format_values(currency, call_time = @call_time, response = @response)
    @datastore << {
      'last': (response[currency.upcase]['last'] * 100).floor,
      'datetime': call_time
    }
  end

end
