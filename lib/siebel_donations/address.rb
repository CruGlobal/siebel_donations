module SiebelDonations
  class Address < Base

    attr_reader :id, :primary, :seasonal, :address1, :address2, :address3, :address4, :city,
                :state, :zip


    def type
      case @type.downcase
      when 'mailing address', 'ship to', 'ma', 'mailng', 'm', 'billing', 'mailin', 'mailig'
        'Mailing'
      else
        @type
      end
    end
  end
end


