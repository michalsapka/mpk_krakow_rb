# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mpk_krakow_rb/version'

Gem::Specification.new do |spec|
  spec.name          = "mpk_krakow_rb"
  spec.version       = MpkKrakowRb::VERSION
  spec.authors       = ["Michal Sapka"]
  spec.email         = ["msapka@gmail.com"]

  spec.summary       = %q{A Ruby wrapper around MPK Krakow timetables}
  spec.description   = %q{A Ruby wrapper around MPK Krakow timetables}
  spec.homepage      = "https://github.com/michalsapka/mpk_krakow_rb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = [] 
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
