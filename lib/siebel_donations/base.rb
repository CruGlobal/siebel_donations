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

      request_timeout = params[:timeout] || SiebelDonations.default_timeout
      params[:response_timeout] ||= request_timeout
      retry_count = params.delete(:retry_count) || SiebelDonations.default_retry_count

      url = SiebelDonations.base_url + path
      headers = { params: params, authorization: "Bearer #{SiebelDonations.oauth_token}" }

      retryable_errors = [RestClient::InternalServerError, Timeout::Error, Errno::ECONNRESET]

      Retryable.retryable on: retryable_errors, times: retry_count, sleep: 20 do
        request_params = { method: :get, url: url, headers: headers, timeout: request_timeout }
        RestClient::Request.execute(request_params) do |response, request, result, &block|
          case response.code
          when 200
            Oj.load(response)
          when 400
            raise RestClient::BadRequest, response
          when 500
            raise RestClient::InternalServerError, response
          else
            puts response.inspect
            puts request.inspect
            raise result.inspect
          end
        end
      end
    end

    def self.find(params)
      get(path, params).collect { |json| new(json) }
    end

  end
end

