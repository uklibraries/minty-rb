Gem::Specification.new do |spec|
  spec.name = "minty-rb"
  spec.version = "0.0.0"
  spec.summary = "minty-rb - minting with an Identity service"
  spec.description = "Minting with an Identity service"
  spec.email = "m.slone@gmail.com"
  spec.homepage = "https://github.com/uklibraries/minty-rb"
  spec.authors = ["Michael Slone"]
  spec.license = "MIT"

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) {|f| File.basename(f)}
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
