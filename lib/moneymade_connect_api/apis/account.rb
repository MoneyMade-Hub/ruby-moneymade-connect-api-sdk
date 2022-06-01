require_relative './api.rb'

class AccountAPI < API
  def get_bank_details(account_id)
    return @client.request({
      method: 'GET',
      url: "api/v1/accounts/#{account_id}/bank-details",
      sign: true,
    })
  end
  
  def get_holdings(account_id)
    return @client.request({
      method: 'GET',
      url: "api/v1/accounts/#{account_id}/holdings",
      sign: true,
    })
  end
end
