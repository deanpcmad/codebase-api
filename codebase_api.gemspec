# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codebase_api/version'

Gem::Specification.new do |gem|
  gem.name          = "codebase_api"
  gem.version       = CodebaseApi::VERSION
  gem.authors       = ["Dean Perry"]
  gem.email         = ["dean@deanperry.net"]
  gem.description   = %q{Ruby gem for accessing the Codebase API}
  gem.summary       = %q{Codebase API Ruby Gem}

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
end
