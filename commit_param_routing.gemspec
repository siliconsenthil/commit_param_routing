# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'commit_param_routing'

Gem::Specification.new do |spec|
  spec.name          = "commit_param_routing"
  spec.version       = CommitParamRouting::VERSION
  spec.authors       = ["Senthil V S"]
  spec.email         = ["vss123@gmail.com"]
  spec.description   = %q{Gem that helps rails project to route to different controller actions based on commit param of the form}
  spec.summary       = %q{Gem that helps rails project to route to different controller actions based on commit param of the form}
  spec.homepage      = "https://github.com/siliconsenthil/commit_param_routing"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'activesupport', '>= 3.2'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
