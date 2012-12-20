# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "loco/version"

Gem::Specification.new do |s|
  s.name        = "loco"
  s.version     = Loco::VERSION
  s.authors     = ["conanite"]
  s.email       = ["conan@conandalton.net"]
  s.homepage    = "https://github.com/conanite/loco"
  s.summary     = %q{Produce statistics concerning numbers of lines of code in project files}
  s.description = %q{Count lines of code in project files, excluding a bunch of common defaults, and show (a) for each N, how many files have N lines of code; (b) how many files of each type and average LOC per file of that type; (c) longest files and their length }

  s.rubyforge_project = "loco"

  # warning: ensure ENV["PATH"] can find your git executable
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
