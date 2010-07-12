# encoding: utf-8

require 'httparty'
require 'mechanize'
require 'json'
require 'singleton'

module VK
  class User
    include HTTParty
    base_uri 'userapi.com'

    def initialize(id)
      @id = id
    end

    def method_missing(method, *args)
      JSON.parse(self.class.get "/data", :query => {:act => method, :id => @id, :sid => VK::Auth.sid})
    end
  end
end
