# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-nitrous/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-nitrous"
  gem.version       = Omniauth::Nitrous::VERSION
  gem.authors       = ["Avi Flombaum"]
  gem.email         = ["avi@learn.co"]
  gem.description   = %q{OAuth 2.0 Strategy for Nitrous}
  gem.summary       = %q{An OAuth 2.0 Strategy for Nitrous}
  gem.homepage      = "https://github.com/learn-co/omniauth-nitrous"

  gem.add_runtime_dependency      'omniauth', '~> 1.0'
  gem.add_runtime_dependency      'omniauth-oauth2', '~> 1.0'
  gem.add_dependency              'multi_json', '~>  1.5'
  gem.add_development_dependency  'simplecov', '~> 0.7'
  gem.add_development_dependency  'rspec', '~> 2.12'
  gem.add_development_dependency  'rack-test'
  gem.add_development_dependency  'webmock'
  gem.add_development_dependency  'rake'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
