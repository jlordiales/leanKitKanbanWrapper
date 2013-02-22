# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'leankit_kanban_wrapper/version'

Gem::Specification.new do |gem|
  gem.name          = "leankit_kanban_wrapper"
  gem.version       = VERSION
  gem.authors       = ["Jose Luis Ordiales Coscia"]
  gem.email         = ["jlordiales@gmail.com"]
  gem.description   = %q{Ruby wrapper around the Leankit Kaban REST API}
  gem.summary       = %q{This gem provides convenience methods to access Leankit Kanban API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
