Gem::Specification.new do |spec|
  spec.name          = "qui"
  spec.version       = "0.8.6"
  spec.authors       = ["Kevin Collette"]
  spec.email         = ["kevcollette@gmail.com"]
  spec.description   = %q{Qui, or Queuemetrics User Integration, is a gem that creates an ActiveRecord wrapper for manipulating users, agents, and queues within the Queuemetrics calling platform.}
  spec.summary       = %q{Qui creates and manages Queuemetrics users and queues.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "mysql2"
  spec.add_dependency "protected_attributes"
  spec.add_dependency "activerecord"
end
