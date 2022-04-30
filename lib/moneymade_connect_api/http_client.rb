require 'uri'
require 'date'
require 'json'
require 'net/http'

require_relative './request_signature.rb'

class HttpClient
  def initialize(api_key, secret)
    @api_key = api_key
    @secret = secret
  end

  def get_method(method)
    case method
    when 'GET';
      return Net::HTTP::Get
    when 'POST'
      return Net::HTTP::Post
    end
  end

  def request(params)
    url = params[:url]
    body = params[:body]
    query = params[:query]
    headers = params[:headers]

    uri = URI(url)
    method = get_method(params[:method])

    if query != nil
      uri.query = URI.encode_www_form(query)
    end
    
    req = method.new(uri)
    req['Content-Type'] = 'application/json'

    if params[:sign]
      timestamp = Time.now.to_i * 1000

      req['x-mm-api-key'] = @api_key
      req['x-mm-request-timestamp'] = timestamp

      req['x-mm-request-signature'] = make_request_signature({
        request_url: url,
        request_body: body,
        request_timestamp: timestamp,
        secret: @secret,
      })
    end

    if headers
      headers.keys.each { |header| req[header] = headers[header] }
    end

    Net::HTTP.start(uri.hostname) do |http|
      response = http.request req
      result_body = response.body()
      result_obj = JSON.parse(result_body)

      if response.code == '200' || response.code == '201'
        return result_obj
      end

      if result_obj['message']
        raise Exception.new result_obj['message']
      end

      raise Exception.new response.message
    end
  end
end