module SiebelDonations
  class Address < Base

    attr_reader :id, :primary, :seasonal, :address1, :address2, :address3, :address4, :city,
                :state, :zip, :country, :updated_at


    def type
      case @type.to_s.downcase
      when '', 'mailing address', 'ship to', 'ma', 'mailng', 'm', 'billing', 'mailin', 'mailig',
           'mailing', 'maling', 'mailign', 'mailingf', 'naukubg', 'maiiling', 'shipping'
        'Mailing'
      else
        @type
      end
    end
  end
end


