# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'che_guevara/version'

Gem::Specification.new do |spec|
  spec.name          = "che_guevara"
  spec.version       = CheGuevara::VERSION
  spec.authors       = ["Domas"]
  spec.email         = ["domas.bitvinskas@me.com"]
  spec.summary       = %q{He shows you the inefficient commands you use in shell.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
