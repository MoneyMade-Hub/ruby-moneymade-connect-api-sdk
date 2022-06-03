require_relative './api.rb'

class TransactionAPI < API
  def get_list(user_id, account_id, queryParams = {})
    $params = {
        limit: queryParams.fetch(:limit, 1),
        offset: queryParams.fetch(:offset, 0),
    };

    $url = "api/v1/users/#{user_id}/accounts/#{account_id}/transactions?limit=#{$params[:limit]}&offset=#{$params[:offset]}"
    
    return @client.request({
      method: 'GET',
      url: $url,
      sign: true,
    })
  end
end
