# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'suzanne/version'

Gem::Specification.new do |spec|
  spec.name          = "suzanne"
  spec.version       = Suzanne::VERSION
  spec.authors       = ["Michael Deutsch"]
  spec.email         = ["mdeutsch@patientslikeme.com"]
  spec.summary       = "Simple Ruby app configuration"
  spec.description   = "Simple Ruby app configuration using ENV and a single YAML file"
  spec.homepage      = "https://github.com/patientslikeme/suzanne"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
