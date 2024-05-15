require_relative '../../spec_helper'
require_relative 'spec_helper'

shared_examples 'entity with a name shorter than 2 characters' do
  it 'has a meaningful error message with length restrictions mentioned' do
    expect(@model.errors.on(:name)).to eq ['Name must be at least 2 characters long']
  end
end

describe 'DataMapper::Validations::Fixtures::Mittelschnauzer' do
  before :all do
    DataMapper::Validations::Fixtures::Mittelschnauzer.auto_migrate!

    @model = DataMapper::Validations::Fixtures::Mittelschnauzer.valid_instance
  end

  it_behaves_like 'valid model'

  describe 'with a 13 characters long name' do
    it_behaves_like 'valid model'
  end

  describe "with a single character name" do
    before :all do
      @model.name = "R"
      @model.valid?
    end

    it_behaves_like 'invalid model'

    it_behaves_like 'entity with a name shorter than 2 characters'
  end

  describe "with blank name" do
    before :all do
      @model.name = ""
      @model.valid?
    end

    it_behaves_like 'invalid model'

    it_behaves_like 'entity with a name shorter than 2 characters'
  end

  describe "persisted, with a single character owner" do
    before :all do
      @model.save
      @model.owner = 'a'
      @model.valid?
    end

    it_behaves_like 'invalid model'
  end
end
