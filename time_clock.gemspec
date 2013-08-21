# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'time_clock/version'

Gem::Specification.new do |spec|
  spec.name          = "time_clock"
  spec.version       = TimeClock::VERSION
  spec.authors       = ["barelyknown"]
  spec.email         = ["sean@buytruckload.com"]
  spec.description   = %q{Calculate the business time for a period of time.}
  spec.summary       = %q{Calculate the business time for a period of time.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "metric_fu"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-rcov-text"
end
