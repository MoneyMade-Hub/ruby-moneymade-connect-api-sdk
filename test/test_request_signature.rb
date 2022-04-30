require "test/unit"
require_relative "../lib/moneymade_connect_api/request_signature.rb"

REQUEST_URL = 'https://account-api.moneymade.io/api/v1'
SECRET = 'SECRET'
REQUEST_TIMESTAMP = 9900009
REQUEST_BODY = { account_id: "test-id" }

SIGNATURE_WITH_BODY = '62e2954c15bba0abf7769f0aba8fa90ff428ccffe51e9e792b04cf394dbbf500'
SIGNATURE_WITH_EMPTY_BODY = 'ac2039fd154739cad01b5699e596ad5703eaeb2b4533b153ad7c3ffce319e7cb'

class TestRequestSignature < Test::Unit::TestCase

  def test_make_request_signature_with_body
    signature = make_request_signature({
      request_url: REQUEST_URL,
      request_timestamp: REQUEST_TIMESTAMP,
      request_body: REQUEST_BODY,
      secret: SECRET,
    })

    assert_equal(signature, SIGNATURE_WITH_BODY)
  end

  def test_make_request_signature_with_empty_body
    signature = make_request_signature({
      request_url: REQUEST_URL,
      request_timestamp: REQUEST_TIMESTAMP,
      secret: SECRET,
    })
  
    assert_equal(signature, SIGNATURE_WITH_EMPTY_BODY)
  end
end