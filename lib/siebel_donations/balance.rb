module SiebelDonations
  class Balance < Base

    def self.path() '/staffAccount/balances'; end

    attr_reader :id, :primary, :staff_conference_savings_fund, :italian_savings_fund,
                :reimbursement_advance, :re_entry_fund, :return_travel_fund, :salary_advance

    def initialize(json)
      @id = json.first

      super(json.last)
    end

  end
end

