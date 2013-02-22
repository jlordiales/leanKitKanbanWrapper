# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'leankit_kanban_wrapper/version'

Gem::Specification.new do |gem|
  gem.name          = "leankit_kanban_wrapper"
  gem.version       = LeankitKanbanWrapper::VERSION
  gem.authors       = ["Jose Luis Ordiales Coscia"]
  gem.email         = ["joseluis.ordiales@tallertechnologies.pe"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
