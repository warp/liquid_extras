# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'locomotive/liquid_extras/version'

Gem::Specification.new do |spec|
  spec.name          = "locomotivecms_liquid_extras"
  spec.version       = Locomotive::LiquidExtras::VERSION
  spec.authors       = ["Ben Tillman"]
  spec.email         = ["ben.tillman@gmail.com"]
  spec.description   = 'Extra liquid filters for LocomotiveCMS'
  spec.summary       = 'LocomotiveCMS Liquid Extras'
  spec.homepage      = 'http://www.locomotivecms.com'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "locomotive_liquid"
  spec.add_dependency "activesupport", "~> 3"
  spec.add_dependency "service_helper"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
