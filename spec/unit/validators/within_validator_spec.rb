require_relative '../../spec_helper'

describe 'DataMapper::Validations::Rule::Within' do
  it 'allows Sets to be passed to the :set option' do
    types = Set.new(%w(home mobile business))

    @model = Class.new do
      include DataMapper::Resource

      def self.name
        'WithinValidatorClass'
      end

      property :id,   DataMapper::Property::Serial
      property :name, String, :auto_validation => false
    end.new

    validator = DataMapper::Validations::Rule::Within.new(:name, :set => types)
    validator.call(@model)

    expect(@model.errors).not_to be_empty
  end
end
