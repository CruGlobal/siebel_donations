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

      params[:response_timeout] ||= SiebelDonations.default_timeout

      url = SiebelDonations.base_url + path
      RestClient::Request.execute(:method => :get, :url => url, :headers => {params: params, authorization: "Bearer #{SiebelDonations.oauth_token}"}, :timeout => -1) { |response, request, result, &block|
        case response.code
        when 200
          Oj.load(response)
        when 400
          raise RestClient::ExceptionWithResponse, response.to_s
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

