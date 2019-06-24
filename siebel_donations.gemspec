# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'siebel_donations/version'

Gem::Specification.new do |gem|
  gem.name          = "siebel_donations"
  gem.version       = SiebelDonations::VERSION
  gem.authors       = ["Josh Starcher"]
  gem.email         = ["josh.starcher@gmail.com"]
  gem.description   = %q{This gem wraps an API to get donation, donor and account information out of Siebel Donor.}
  gem.summary       = %q{Get donation information from Siebel Donor}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('rest-client', '~> 2.0.2')
  gem.add_dependency('oj', '>= 2.18')
  gem.add_dependency('activesupport', '>= 3.0.0')
  gem.add_dependency('retryable-rb', '~> 1.1.0')

end
