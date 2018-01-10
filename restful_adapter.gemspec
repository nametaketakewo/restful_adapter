
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'restful_adapter/version'

Gem::Specification.new do |spec|
  spec.name          = 'restful_adapter'
  spec.version       = RestfulAdapter::VERSION
  spec.authors       = ['Harutaka Takeuchi']
  spec.email         = ['nametaketakewo@icloud.com']

  spec.summary       = 'Adapter for ActiveModel::Serializer that enables output in RESTful format.'
  spec.description   = 'Adapter for ActiveModel::Serializer that enables output in RESTful format.'
  spec.homepage      = 'https://github.com/texam/restful_adapter'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    fail 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'active_model_serializers', '~> 0.10.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
end
