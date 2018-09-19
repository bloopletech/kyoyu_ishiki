
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kyōyū_ishiki/version"

Gem::Specification.new do |spec|
  spec.name          = "kyoyu_ishiki"
  spec.version       = KyōyūIshiki::VERSION
  spec.authors       = ["Brenton \"B-Train\" Fletcher"]
  spec.email         = ["i@bloople.net"]

  spec.summary       = %q{Serves files and directories over HTTP.}
  spec.description   = %q{Serves files and directories over HTTP.}
  spec.homepage      = "http://bloople.net/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = "kyōyū_ishiki"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_dependency "rack", "~> 2.0"
  spec.add_dependency "puma"
end
