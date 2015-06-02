require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Nitrous < OmniAuth::Strategies::OAuth2
      option :name, "nitrous"  
      option :client_options, {
        :site => "https://pro.nitrous.io",
        :request_token_path => "/api/v0/oauth/authorize?response_type=code",
        :access_token_path => "/api/v0/oauth/token",
        :authorize_path => "/api/v0/oauth/authorize?response_type=code"        
      }
    end
  end
end