require 'dm-core/spec/setup'
require 'dm-core/spec/lib/adapter_helpers'

require 'dm-validations'
require 'dm-types'
require 'dm-migrations'

class Hash
  def except(*keys)
    hash = dup
    keys.each { |key| hash.delete(key) }
    hash
  end
end

Dir["#{File.realpath(File.dirname(__FILE__))}/fixtures/**/*.rb"].sort.each { |file| require file }
Dir["#{File.realpath(File.dirname(__FILE__))}/integration/shared/**/*.rb"].sort.each { |file| require file }

DataMapper::Spec.setup
DataMapper.finalize

RSpec.configure do |config|
  config.extend(DataMapper::Spec::Adapters::Helpers)

  config.before :suite do
    DataMapper.finalize.auto_migrate!
  end
end
