# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq/scheduler/notification/version'

Gem::Specification.new do |spec|
  spec.name          = "sidekiq-scheduler-notification"
  spec.version       = Sidekiq::Scheduler::Notification::VERSION
  spec.authors       = ["SHIBATA Hiroshi"]
  spec.email         = ["hsbt@ruby-lang.org"]

  spec.summary       = %q{Slack notification middleware for sidekiq-scheduler}
  spec.description   = %q{Slack notification middleware for sidekiq-scheduler}
  spec.homepage      = "https://github.com/hsbt/sidekiq-scheduler-notification"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'sidekiq-scheduler'
  spec.add_dependency 'slack-notifier'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
