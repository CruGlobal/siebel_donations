module SiebelDonations
  class Donor < Base

    def self.path() '/donors'; end

    attr_reader :id, :account_name, :contacts, :addresses, :type

    def initialize(json)
      super

      @contacts = json['contacts'].collect { |contact_json| Contact.new(contact_json) } if json['contacts']
      @addresses = json['addresses'].collect { |address_json| Contact.new(address_json) } if json['addresses']
    end

  end
end

