require 'spec_helper'

describe SiebelDonations::Donation do
  context '.find' do
    context 'by a designation number' do
      it "returns an array of donations" do
        donation_json = Oj.load '[ { "id": "XGF5T", "amount": "10.00", "designation": "0588176", "donorId": "000599596", "donationDate": "2007-10-21", "paymentMethod": "Credit Card", "paymentType": "Visa", "channel": "Recurring", "campaignCode": "CCWBST" } ]'
        SiebelDonations::Donation.should_receive(:get).and_return(donation_json)

        donations = SiebelDonations::Donation.find(designations: '0559826',
                                                   start_date: '2012-01-01',
                                                   end_date: '2013-01-01')

        donations.length.should == 1
      end
    end
  end
end
