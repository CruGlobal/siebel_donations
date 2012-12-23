module SiebelDonations
  class Contact < Base

    attr_reader :id, :primary, :first_name, :preferred_name, :middle_name, :last_name,
                :title, :suffix, :sex, :phone_numbers, :email_addresses

    def initialize(json = {})
      super

      @phone_numbers = json['phoneNumbers'] ? json['phoneNumbers'].collect { |phone_json| SiebelDonations::PhoneNumber.new(phone_json) } : []
      @email_addresses = json['emailAddresses'] ? json['emailAddresses'].collect { |email_json| SiebelDonations::EmailAddress.new(email_json) } : []
    end

    def primary_email_address
      @email_addresses.detect(&:primary) || @email_addresses.first
    end

    def primary_phone_number
      @phone_numbers.detect(&:primary) || @phone_numbers.first
    end

  end
end


