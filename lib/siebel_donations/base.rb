require 'rest-client'
require 'oj'

module SiebelDonations
  class Base

    def initialize(json = {})
      json.each do |key, value|
        instance_variable_set("@#{key.underscore}", value)
      end
    end

    def self.get(path, params)
      raise 'You need to configure SiebelDonations with your oauth_token.' unless SiebelDonations.oauth_token
      url = SiebelDonations.base_url + path
      RestClient.get(url, {params: params, timeout: -1, authorization: "Bearer #{SiebelDonations.oauth_token}"}) { |response, request, result, &block|
        case response.code
        when 200
          Oj.load(response)
        else
          puts response.inspect
          puts request.inspect
          raise result.inspect
        end
      }
    end

    def self.find(params)
      get(path, params).collect { |json| new(json) }
    end

  end
end

