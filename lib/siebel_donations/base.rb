module SiebelDonations
  class Base

    def get(path, params)
      raise 'You need to configure SiebelDonations with your oauth_token.' unless SiebelDonations.oauth_token
      url = SiebelDonations.base_url + path
      RestClient.get(url, {params: params, timeout: -1, authorization: "Bearer #{SiebelDonations.oauth_token}"}) { |response, request, result, &block|
        case response.code
        when 200
          Oj.load(response)
        else
          raise result.inpect
        end
      }
    end

  end
end

