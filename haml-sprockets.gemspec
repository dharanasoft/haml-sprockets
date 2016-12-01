# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "haml-sprockets/version"

Gem::Specification.new do |s|
  s.name        = "haml-sprockets"
  s.version     = Haml::Sprockets::VERSION
  s.authors     = ["vagmi", "dhruvasagar", "deepakprasanna"]
  s.email       = ["vagmi.mudumbai@gmail.com", "dhruva.sagar@gmail.com"]
  s.homepage    = "https://github.com/dharanasoft/haml-sprockets"
  s.summary     = %q{Use the awesome haml-js javascript templating lib in Ruby}
  s.description = %q{Use the JST processor and have haml code read in and appended to application.js}

  s.rubyforge_project = "haml-sprockets"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "tilt", "~> 1.3"
  s.add_runtime_dependency "sprockets", "~> 2.1"
  s.add_runtime_dependency "execjs", "~> 2.7.0"

  s.add_development_dependency 'rspec'
end
