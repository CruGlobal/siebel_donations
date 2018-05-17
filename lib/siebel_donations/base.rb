require 'rest-client'
require 'oj'
require 'retryable'

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
      Retryable.retryable :on => [RestClient::InternalServerError, Timeout::Error, Errno::ECONNRESET], :times => 20, :sleep => 20 do
        RestClient::Request.execute(:method => :get, :url => url, :headers => {params: params, authorization: "Bearer #{SiebelDonations.oauth_token}"}, :timeout => nil) { |response, request, result, &block|
          case response.code
          when 200
            Oj.load(response.unpack("C*").pack("U*").force_encoding("UTF-8").encode!)
          when 400
            raise RestClient::BadRequest, response
          when 500
            raise RestClient::InternalServerError, response
          else
            puts response.inspect
            puts request.inspect
            raise result.inspect
          end
        }
      end
    end

    def self.find(params)
      get(path, params).collect { |json| new(json) }
    end

  end
end

