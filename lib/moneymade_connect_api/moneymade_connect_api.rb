require_relative './http_client.rb'

class MoneyMadeConnectApi
  @@project_api_url = 'https://project-api.moneymade.io' 

  def initialize(config)
    @client = HttpClient.new(config[:api_key], config[:secret])
    
    project_params = @client.request({
      url: @@project_api_url + '/api/v1/environment',
      method: 'GET',
      headers: { 'api-key': config[:api_key] }
    })

    @account_api_url = project_params['account_api_url']
    @sentry_dsn = project_params['sentry_dsn']
  end
end
