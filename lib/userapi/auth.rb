# encoding: utf-8

require 'singleton'

module VK
  class Auth
    include Singleton
    include HTTParty

    base_uri 'login.userapi.com'

    class << self
      attr_reader :sid, :user_id
    end

    def self.login!(login,password)
      begin
        self.get "/auth?login=force&site=2&email=#{login}&pass=#{password}", :no_follow => true
      rescue HTTParty::RedirectionTooDeep => response
        @sid = /.*;sid=(\w*)$/.match(response.response.header['location'])[1]
        @user_id = /remixmid=(\d+)/.match(response.response.header['set-cookie'])[1]
        return true
      else
        raise VK::AuthFail
      end
    end
  end

  class AuthFail < Exception; end
end
