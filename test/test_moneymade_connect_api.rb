require 'test/unit'
require 'dotenv/load'

require_relative '../lib/moneymade_connect_api/moneymade_connect_api.rb'

TEST_PROJECT_API_URL = ENV['TEST_PROJECT_API_URL']
TEST_SECRET = ENV['TEST_SECRET']
TEST_API_KEY = ENV['TEST_API_KEY']

if ENV['TEST_PROJECT_API_URL']
  MoneyMadeConnectApi.class_variable_set('@@project_api_url', TEST_PROJECT_API_URL)
end

$sdk = MoneyMadeConnectApi.new({
  api_key: TEST_API_KEY,
  secret: TEST_SECRET,
})

class TestSimpleNumber < Test::Unit::TestCase

end
