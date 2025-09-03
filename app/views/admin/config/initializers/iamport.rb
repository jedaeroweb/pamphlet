# frozen_string_literal: true

Iamport.configure do |config|
  config.api_key = ENV['importId']
  config.api_secret = ENV['importPw']
end