# encoding: utf-8

require 'json'

module VK
  class User
    include HTTParty
    base_uri 'userapi.com'

    def initialize(id)
      @id = id
    end

    def user_id(p)
      123 if p == 1
    end

    def method_missing(method, *args)
      JSON.parse(self.class.get "/data", :query => {:act => method, :id => @id, :sid => VK::Auth.sid})
    end
  end
end
