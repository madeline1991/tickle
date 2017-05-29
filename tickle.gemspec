$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tickle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tickle"
  s.version     = Tickle::VERSION
  s.authors     = ["Madeline LeClair"]
  s.email       = ["madelineleclair@gmail.com"]
  s.homepage    = 'https://github.com/ruby/rake'
  s.summary     = "Used to calculate the pricking for TICKLE"
  s.description = "Calculates pricing for TICKLE"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.3"

  s.add_development_dependency "postgresql"
end
