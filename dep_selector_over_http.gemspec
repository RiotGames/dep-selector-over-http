$:.unshift(File.expand_path("../lib", __FILE__))
require 'dep_selector/dep_selector_version'

Gem::Specification.new do |s|
  s.name = "dep_selector_over_http"
  s.version = DepSelector::VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false
  s.summary = "Given packages, versions, and a dependency graph, find a valid assignment of package versions"
  s.description = s.summary
  s.license = 'Apache v2'
  s.authors = ["Josiah Kiehl"]
  s.email = ["cw@opscode.com", "mark@opscode.com"]
  s.homepage = %q{http://github.com/RiotGames/dep-selector-over-http}
  s.require_path = 'lib'
  s.files = Dir.glob("lib/**/*.{rb}") + Dir.glob("ext/**/*.{i,c,cxx,h,cpp,rb}")
end
