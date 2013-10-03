# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arrthorizer/version'

Gem::Specification.new do |gem|
  gem.name          = "arrthorizer"
  gem.version       = Arrthorizer::VERSION
  gem.authors       = ["René van den Berg"]
  gem.email         = ["r.van.den.berg@ogd.nl"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency             'rails'
  gem.add_development_dependency 'combustion', '~> 0.5.1'
  gem.add_development_dependency 'sqlite3'
  gem.add_development_dependency 'rspec-rails'
end
