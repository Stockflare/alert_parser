# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alert_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "alert_parser"
  spec.version       = AlertParser::VERSION
  spec.authors       = ["davidkelley"]
  spec.email         = ["david.james.kelley@gmail.com"]
  spec.summary       = %q{Parses Stockflare Alerts}
  spec.description   = %q{Parses Stockflare Alerts, translating data into a localized message}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency %q<bundler>, ['~> 1.6']
  spec.add_development_dependency %q<rake>, ['~> 10.3']
  spec.add_development_dependency %q<rspec>, ['~> 3.0']
  spec.add_development_dependency %q<faker>, ['~> 1.4']
  spec.add_development_dependency %q<dotenv>, ['~> 2.0']
end
