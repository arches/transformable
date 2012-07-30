# -*- encoding: utf-8 -*-
require File.expand_path('../lib/transformable/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Doyle"]
  gem.email         = ["archslide@gmail.com"]
  gem.description   = %q{Lets you manipulate data as it's being set on an object without a lot of setter method boilerplate}
  gem.summary       = %q{Transform object inputs}
  gem.homepage      = "http://github.com/arches/transformable"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "transformable"
  gem.require_paths = ["lib"]
  gem.version       = Transformable::VERSION
end
