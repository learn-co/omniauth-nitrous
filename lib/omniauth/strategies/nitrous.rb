require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Nitrous < OmniAuth::Strategies::OAuth2
      option :name, "nitrous"
      option :client_options, { :site => "https://pro.nitrous.io",
                                :request_token_path => "/api/v0/oauth/authorize?response_type=code&client_id=",
                                :access_token_path => "/1/OAuthGetAccessToken",
                                :authorize_path => "/1/OAuthAuthorizeToken" }

      uid do
        raw_info['id']
      end

      info do
        {
          :name => raw_info['fullName'],
          :email => raw_info['email'],
          :nickname => raw_info['username'],
          :urls => {
            :profile => raw_info['url']
          }
        }
      end


      extra do
        {
          'raw_info' => raw_info
        }
      end

      def request_phase
        options[:authorize_params] = {
          :name => options['app_name'],
          :scope => options['scope'] || 'read'
        }
        options[:authorize_params].merge!(:expiration => options['expiration']) if options['expiration']
        super
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/1/members/me').body)
      end
    end
  end
end
