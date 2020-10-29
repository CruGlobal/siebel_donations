require 'spec_helper'

describe SiebelDonations::Base do
  context '.get' do
    context 'with timeout param set' do
      it 'passes param to RestClient' do
        expect(RestClient::Request).to receive(:execute)
          .with(hash_including(url: SiebelDonations.base_url, timeout: 123))
          .and_return(nil)

        described_class.get('', timeout: 123)
      end
    end

    context 'without timeout param set' do
      it 'passes default to RestClient' do
        expect(RestClient::Request).to receive(:execute)
          .with(hash_including(timeout: 6000))
          .and_return(nil)

        described_class.get('', {})
      end
    end
  end
end
