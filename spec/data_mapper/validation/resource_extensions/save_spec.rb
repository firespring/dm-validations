require_relative '../../../spec_helper'
require 'data_mapper/validation/resource_extensions'

describe DataMapper::Validation::ResourceExtensions, '#save' do
  before :all do
    class SaveTestResource
      include DataMapper::Resource

      property :id, Serial

      def _persist
        self
      end
    end

    SaveTestResource.finalize
  end

  subject { SaveTestResource.new }

  it 'returns false when #valid? returns false' do
    expect(subject).to receive(:valid?).and_return(false)

    expect(subject.save).to be_false
  end

  it 'calls #validation_rules.assert_valid_context with its #default_validation_context' do
    context_name = :default
    contextual_rule_set = mock(DataMapper::Validation::ContextualRuleSet)
    contextual_rule_set.stub(:current_context)
    subject.stub(:save_self)
    subject.stub(:validation_rules => contextual_rule_set)

    expect(subject).to receive(:default_validation_context).and_return(context_name)
    expect(contextual_rule_set).to receive(:assert_valid_context).with(context_name)

    subject.save
  end

  it 'calls #save_self' do
    expect(subject).to receive(:save_self)

    subject.save
  end

  it 'pushes its default_validation_context on the Context stack' do
    context_name = :default
    allow(subject).to receive(:default_validation_context).and_return(context_name)
    expect(subject).to receive(:_save) do
      expect(DataMapper::Validation::Context.current).to be(context_name)
    end

    subject.save
  end

end
