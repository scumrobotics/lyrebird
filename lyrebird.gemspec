# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lyrebird/version'

Gem::Specification.new do |spec|
  spec.name          = "lyrebird"
  spec.version       = Lyrebird::VERSION
  spec.authors       = ["Dean Pisani"]
  spec.email         = ["dpisani93@gmail.com"]

  spec.summary       = %q{Functional testing helpers for Arduino sketches}
  spec.description   = %q{Lyrebird helps test Arduino sketches by programming actual Arduino devices and mimicking I/O sequences using a 2-board system.}
  spec.homepage      = "https://github.com/scumrobotics/lyrebird"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
