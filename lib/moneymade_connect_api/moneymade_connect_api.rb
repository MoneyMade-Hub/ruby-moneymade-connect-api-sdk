require_relative './http_client.rb'

require_relative './apis/user.rb'

class MoneyMadeConnectApi
  @@project_api_url = 'https://project-api.moneymade.io' 

  def initialize(config)
    client = HttpClient.new(config[:api_key], config[:secret], @@project_api_url)
    
    project_params = client.request({
      url: '/api/v1/environment',
      method: 'GET',
      headers: { 'api-key': config[:api_key] }
    })

    @account_api_url = project_params['account_api_url']
    @sentry_dsn = project_params['sentry_dsn']

    @client = HttpClient.new(config[:api_key], config[:secret], @account_api_url)
    
    @users = UserAPI.new @client
  end

  def users
    @users
  end
end
