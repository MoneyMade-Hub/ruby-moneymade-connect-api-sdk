require 'json'
require 'openssl'

def make_request_signature(params)
  body = params[:request_body]
  json_body = body != nil ? body.to_json : ''

  secret = params[:secret]
  timestamp = params[:request_timestamp]
  url = params[:request_url]

  data = "#{timestamp}#{url}#{json_body}"
  digest = OpenSSL::Digest.new('sha256')
  hmac = OpenSSL::HMAC.hexdigest(digest, secret, data)
  
  return hmac
end