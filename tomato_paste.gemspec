# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tomato_paste/version'

Gem::Specification.new do |spec|
  spec.name          = "tomato_paste"
  spec.version       = TomatoPaste::VERSION
  spec.authors       = ["mariozig"]
  spec.email         = ["mariozig@gmail.com"]
  spec.description   = %q{A concentrated version of the Pomodoro technique written in Ruby just for you (and me)}
  spec.summary       = %q{A quick and dirty pomodoro timer}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rb-fsevent"
  spec.add_development_dependency "terminal-notifier-guard"
  spec.add_development_dependency "timecop"
end
