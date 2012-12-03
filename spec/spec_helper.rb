$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require'rspec'
require'siebel_donations'
require 'webmock/rspec'
RSpec.configure do |config|
end

SiebelDonations.configure do |config|
  config.oauth_token = 'foo'
end
