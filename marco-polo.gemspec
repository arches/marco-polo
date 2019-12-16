require File.expand_path('../lib/marco-polo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name                = "marco-polo"

  gem.authors             = ["Chris Doyle"]
  gem.email               = ["archslide@gmail.com"]

  gem.description         = "MarcoPolo shows your app name and environment in your console prompt so you don't accidentally break production"
  gem.summary             = "MarcoPolo shows your app name and environment in your console prompt"
  gem.homepage            = "http://github.com/arches/marco-polo"
  gem.version             = MarcoPolo::VERSION
  gem.license             = 'MIT'

  gem.files               = `git ls-files`.split($\)
  gem.add_runtime_dependency "railties", ">= 6"
end
