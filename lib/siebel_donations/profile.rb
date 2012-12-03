module SiebelDonations
  class Profile < Base

    def self.path() '/profiles'; end

    attr_reader :id, :name, :designations

    def initialize(json)
      super

      @designations = json['designations'].collect { |designation_json| Designation.new(designation_json) }
    end

  end
end

