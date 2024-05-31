source 'https://rubygems.org'

gemspec

DM_VERSION     = '~> 1.3.0.beta'.freeze
DO_VERSION     = '~> 0.10.17'.freeze
DM_DO_ADAPTERS = %w(sqlite postgres mysql oracle sqlserver).freeze
CURRENT_BRANCH = ENV.fetch('GIT_BRANCH', 'master')

gem 'dm-core', DM_VERSION, github: 'firespring/dm-core', branch: CURRENT_BRANCH

group :datamapper do
  adapters = ENV['ADAPTER'] || ENV.fetch('ADAPTERS', nil)
  adapters = adapters.to_s.tr(',', ' ').split.uniq - %w(in_memory)

  if (do_adapters = DM_DO_ADAPTERS & adapters).any?
    do_options = {}
    do_options[:github] = 'firespring/datamapper-do' if ENV['DO_GIT'] == 'true'

    gem 'data_objects', DO_VERSION, do_options.dup

    do_adapters.each do |adapter|
      adapter = 'sqlite3' if adapter == 'sqlite'
      gem "do_#{adapter}", DO_VERSION, do_options.dup
    end

    gem 'dm-do-adapter', DM_VERSION, github: 'firespring/dm-do-adapter', branch: CURRENT_BRANCH
  end

  adapters.each do |adapter|
    gem "dm-#{adapter}-adapter", DM_VERSION, github: "firespring/dm-#{adapter}-adapter", branch: CURRENT_BRANCH
  end

  plugins = ENV['PLUGINS'] || ENV.fetch('PLUGIN', nil)
  plugins = plugins.to_s.tr(',', ' ').split.uniq << 'dm-types' << 'dm-migrations'

  plugins.each do |plugin|
    gem plugin, DM_VERSION, github: "firespring/#{plugin}", branch: CURRENT_BRANCH
  end
end

group :development do
  gem 'rake'
  gem 'rspec'
end
