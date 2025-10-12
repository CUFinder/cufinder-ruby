Gem::Specification.new do |spec|
  spec.name          = "cufinder-ruby"
  spec.version       = "1.0.0"
  spec.authors       = ["CUFinder Team"]
  spec.email         = ["support@cufinder.io"]

  spec.summary       = "Ruby SDK for the CUFinder API"
  spec.description   = "Official Ruby SDK for accessing CUFinder's services"
  spec.homepage      = "https://github.com/cufinder/cufinder-ruby"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cufinder/cufinder-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/cufinder/cufinder-ruby/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.21"
  spec.add_dependency "json", "~> 2.6"

  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "webmock", "~> 3.18"
  spec.add_development_dependency "rake", "~> 13.0"
end
