# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq_namespaced/version'

Gem::Specification.new do |spec|
  spec.name          = "sidekiq_namespaced"
  spec.version       = SidekiqNamespaced::VERSION
  spec.authors       = ["Alex Bartlow"]
  spec.email         = ["bartlowa@gmail.com"]
  spec.summary       = %q{Provides the Sidekiq.with_namepace function to access different namespaces through sidekiq's API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency "sidekiq", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
