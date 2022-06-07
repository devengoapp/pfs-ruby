require_relative 'lib/pfs/version'

Gem::Specification.new do |spec|
  spec.name          = "pfs"
  spec.version       = PFS::VERSION
  spec.authors       = ["Aitor García Rey"]
  spec.email         = ["aitor@devengo.com"]

  spec.summary       = %q{PFS Finac API ruby client}
  spec.description   = %q{A ruby client to consume PFS Finac API}
  spec.homepage      = "https://github.com/devengo/pfs-ruby"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/devengo/pfs-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/devengo/pfs-ruby/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  #  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.0"
  spec.add_dependency "faraday", '>= 0.15'
end
