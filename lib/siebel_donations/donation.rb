module SiebelDonations
  class Donation < Base
    PATH = '/donations'

    def self.find(params = {})
      new.get(PATH, params)
    end
  end
end
