lib = File.expand_path("lib", __dir__)
doc_path = File.expand_path("doc", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "galaxy/invaders/version"

Gem::Specification.new do |spec|
  spec.name          = "galaxy-invaders"
  spec.version       = Galaxy::Invaders::VERSION
  spec.authors       = ["Alexandr Korsak"]
  spec.email         = ["alex.korsak@gmail.com"]

  spec.summary       = %q{Space invaders are upon us! You were shortlisted as one of the great minds to help us track them down.}
  spec.description   = File.read(File.join(doc_path, 'space-noise-message.md'))
  spec.homepage      = "http://www.example.com"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://www.example.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://gitlab.com/oivoodoo/galaxy-invaders"
  spec.metadata["changelog_uri"] = "https://gitlab.com/oivoodoo/galaxy-invaders/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
