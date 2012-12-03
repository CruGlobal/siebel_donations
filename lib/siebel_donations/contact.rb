module SiebelDonations
  class Contact < Base

    attr_reader :id, :primary, :first_name, :preferred_name, :middle_name, :last_name,
                :title, :sufix, :sex, :phone_numbers, :email_addresses

    def initialize(json)
      super

      @phone_numbers = json['phoneNumbers'].collect { |phone_json| SiebelDonations::PhoneNumber.new(phone_json) } if json['phoneNumbers']
      @email_addresses = json['emailAddresses'].collect { |email_json| SiebelDonations::EmailAddress.new(email_json) } if json['emailAddresses']
    end

  end
end


