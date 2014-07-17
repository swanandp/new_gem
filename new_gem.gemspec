# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'new_gem/version'

Gem::Specification.new do |s|
  s.name        = 'new_gem'
  s.version     = NewGem::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Swanand Pagnis']
  s.email       = ['swanand.pagnis@gmail.com']
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = 'new-gem'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
