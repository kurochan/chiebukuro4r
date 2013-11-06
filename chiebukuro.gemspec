# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chiebukuro/version'

Gem::Specification.new do |spec|
  spec.name          = "chiebukuro"
  spec.version       = Chiebukuro::VERSION
  spec.authors       = ["kurochan"]
  spec.email         = ["kuro@kurochan.org"]
  spec.description   = %q{Yahoo Chiebukuro helper}
  spec.summary       = %q{Yahoo Chiebukuro helper}
  spec.homepage      = "https://github.com/kurochan/chiebukuro4r"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "active_support"
  spec.add_dependency "nokogiri"
end
