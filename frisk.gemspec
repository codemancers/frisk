$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "frisk/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "frisk"
  s.version     = Frisk::VERSION
  s.authors     = ["Emil Soman"]
  s.email       = ["emil.soman@gmail.com"]
  s.homepage    = ""
  s.summary     = "A tool to test/document your APIs"
  s.description = "Coming soon"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency "angularjs-rails"
  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"
end
