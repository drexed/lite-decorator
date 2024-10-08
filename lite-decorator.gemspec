# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lite/decorator/version"

Gem::Specification.new do |spec|
  spec.name = "lite-decorator"
  spec.version = Lite::Decorator::VERSION
  spec.authors = ["Juan Gomez"]
  spec.email = %w[j.gomez@drexed.com]

  spec.summary = "Ruby Decorator based framework (aka decorator/presenter objects)"
  spec.homepage = "http://drexed.github.io/lite-decorator"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["changelog_uri"] = "https://github.com/drexed/lite-decorator/blob/master/CHANGELOG.md"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["source_code_uri"] = "https://github.com/drexed/lite-decorator"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "generator_spec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "sqlite3"
end
