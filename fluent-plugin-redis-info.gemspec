# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-redis-info"
  spec.version       = "0.0.1"
  spec.authors       = ["zhuang yongyao"]
  spec.email         = ["andyzyy@gmail.com"]
  spec.description   = "Redis info input plugin for Fluent event collector"
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/andyzhuangyy/fluent-plugin-redis-info"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake" 
  spec.add_runtime_dependency "fluentd"
  spec.add_runtime_dependency "redis"
end
