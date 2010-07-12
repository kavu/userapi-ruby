# encoding: utf-8

require 'mechanize'
require 'singleton'

module VK
  class Auth
    include Singleton

    class << self
      attr_reader :sid, :user_id
    end

    def self.login!(login,password)
      agent = Mechanize.new
      url = "http://login.userapi.com/auth?login=force&site=2&email=#{login}&pass=#{password}"
      login_page = agent.get(url)

      if !agent.cookies.nil?
	@user_id = /remixmid=(\d+)/.match(agent.cookies[0].to_s)[1]
	@sid = /.*;sid=(\w*)/.match(login_page.uri.to_s)[1]
      end
    end
  end
end
