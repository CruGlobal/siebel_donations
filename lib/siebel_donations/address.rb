module SiebelDonations
  class Address < Base

    attr_reader :id, :type, :primary, :seasonal, :address1, :address2, :address3, :address4, :city,
                :state, :zip

  end
end


