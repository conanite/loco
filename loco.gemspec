# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "loco/version"

Gem::Specification.new do |s|
  s.name        = "loco"
  s.version     = Loco::VERSION
  s.authors     = ["conanite"]
  s.email       = ["conan@conandalton.net"]
  s.homepage    = "https://github.com/conanite/loco"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "loco"

  # warning: ensure ENV["PATH"] can find your git executable
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
