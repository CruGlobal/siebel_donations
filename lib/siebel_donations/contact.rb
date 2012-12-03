module SiebelDonations
  class Contact < Base

    attr_reader :id, :primary, :first_name, :preferred_name, :middle_name, :last_name,
                :title, :sufix, :sex, :phone_numbers, :email_addresses

    def initialize(json)
      super

      @phone_numbers = json['phone_numbers'].collect { |phone_json| PhoneNumber.new(phone_json) } if json['phone_numbers']
      @email_addresses = json['email_addresses'].collect { |email_json| EmailAddress.new(email_json) } if json['email_addresses']
    end

  end
end


