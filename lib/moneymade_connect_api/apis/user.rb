require_relative './api.rb'

class UserAPI < API
  def create(user)
    return @client.request({
      body: user,
      url: 'api/v2/users',
      method: 'POST',
      sign: true,
    })
  end

  def get_one(user_id)
    return @client.request({
      method: 'GET',
      url: "api/v1/users/#{user_id}",
      sign: true,
    })
  end

  def create_session(user_id)
    return @client.request({
      method: 'POST',
      url: "api/v2/users/#{user_id}/sessions",
      sign: true,
    })
  end
end