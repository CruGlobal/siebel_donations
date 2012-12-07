require 'active_support/core_ext/string/inflections'
require 'siebel_donations/base'

Dir[File.dirname(__FILE__) + '/siebel_donations/*.rb'].each do |file|
  require file
end

module SiebelDonations
  class << self
    attr_accessor :base_url, :oauth_token, :default_timeout

    def configure
      yield self
    end

    def base_url
      @base_url ||= "http://hart-a321.net.ccci.org:9980/wsapi/rest"
    end

    def default_timeout
      @default_timeout || 6000
    end
  end
end

