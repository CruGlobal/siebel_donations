module SiebelDonations
  class Designation < Base

    attr_reader :number, :description, :chartfield, :staff_account_id

    def account_type
      @chartfield.present? ? 'Chartfield' : 'StaffAccount'
    end

    def balances(account_types = nil)
      if @account_type == 'Chartfield'
        raise 'Balance information is not currently available for chartfields'
      else
        Balance.find(employee_ids: @staff_account_id, staff_account_types: account_types || 'primary').first
      end
    end

  end
end


