require_relative './api.rb'

class ProviderAPI < API
  def get_list(queryParams = {})
    $params = {
        limit: queryParams.fetch(:limit, 25),
        offset: queryParams.fetch(:offset, 0),
    };

    return @client.request({
      method: 'GET',
      url: "api/v1/providers?limit=#{$params[:limit]}&offset=#{$params[:offset]}",
      sign: true,
    })
  end

  def get_one(slug)
    return @client.request({
      method: 'GET',
      url: "api/v1/providers/#{slug}",
      sign: true,
    })
  end
end