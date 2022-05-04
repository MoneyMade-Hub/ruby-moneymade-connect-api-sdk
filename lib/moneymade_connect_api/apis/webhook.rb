require_relative './api.rb'

class WebhookAPI < API
  def create(data)
    return @client.request({
      method: 'POST',
      url: "api/v1/webhooks",
      body: data,
      sign: true,
    })
  end
 
  def get_one(webhook_id)
    return @client.request({
      method: 'GET',
      url: "api/v1/webhooks/#{webhook_id}",
      sign: true,
    })
  end
  
  def get_list()
    return @client.request({
      method: 'GET',
      url: "api/v1/webhooks",
      sign: true,
    })
  end
  
  def delete_webhook(webhook_id)
    return @client.request({
      method: 'DELETE',
      url: "api/v1/webhooks/#{webhook_id}",
      sign: true,
    })
  end
end
