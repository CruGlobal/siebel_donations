module SiebelDonations
  class Donation < Base

    def self.path() '/donations'; end

    attr_reader :id, :amount, :designation, :donor_id, :donation_date, :payment_method,
                :payment_type, :channel, :campaign_code

  end
end
