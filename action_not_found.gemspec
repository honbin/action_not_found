$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "action_not_found/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "action_not_found"
  s.version     = ActionNotFound::VERSION
  s.authors     = ["Satoshi Honda"]
  s.email       = ["bin.honda@gmail.com"]
  s.homepage    = "https://github.com/honbin/action_not_found"
  s.summary     = "Rails plugin to see not found action"
  s.description = "This is a Rails plugin to see not found action"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 3.2.0"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
