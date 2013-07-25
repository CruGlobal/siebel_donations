module SiebelDonations
  class Donor < Base

    def self.path() '/donors'; end

    attr_reader :id, :account_name, :contacts, :addresses, :type, :updated_at

    def initialize(json = {})
      super

      @contacts = json['contacts'] ? json['contacts'].collect { |contact_json| SiebelDonations::Contact.new(contact_json) } : []
      @addresses = json['addresses'] ? json['addresses'].collect { |address_json| SiebelDonations::Address.new(address_json) } : []
    end

    def primary_contact
      @contacts.detect(&:primary) || @contacts.first
    end

    def primary_address
      @addresses.detect(&:primary) || @addresses.first
    end

  end
end

