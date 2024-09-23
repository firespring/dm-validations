require File.expand_path('../lib/data_mapper/validation/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors = ['Guy van den Berg', 'Emmanuel Gomez']
  gem.email = ['emmanuel.gomez@gmail.com']
  gem.summary = 'Library for performing validations on DataMapper resources and plain Ruby objects'
  gem.description = 'This is a DataMapper plugin that provides validations for DataMapper model classes.'
  gem.homepage = 'https://datamapper.org'
  gem.license = 'Nonstandard'

  gem.files = `git ls-files`.split("\n")
  gem.extra_rdoc_files = %w(LICENSE README.rdoc)

  gem.name = 'sbf-dm-validations'
  gem.require_paths = ['lib']
  gem.version = DataMapper::Validation::VERSION
  gem.required_ruby_version = '>= 2.7.8'

  gem.add_runtime_dependency('sbf-dm-core', '~> 1.3.0.beta')
end
