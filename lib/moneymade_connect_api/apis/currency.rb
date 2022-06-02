require_relative './api.rb'

class CurrencyAPI < API
  def get_list()
    return @client.request({
      method: 'GET',
      url: "api/v1/currencies",
      sign: true,
    })
  end
end