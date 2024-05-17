require_relative '../../spec_helper'
require_relative 'spec_helper'

shared_examples 'barcode with invalid code length' do
  it 'has a meaningful error message with length restrictions mentioned' do
    expect(@model.errors.on(:code)).to eq ['Code must be at most 10 characters long']
  end
end

describe 'DataMapper::Validations::Fixtures::Barcode' do
  before :all do
    DataMapper::Validations::Fixtures::Barcode.auto_migrate!

    @model = DataMapper::Validations::Fixtures::Barcode.valid_instance
  end

  it_behaves_like 'valid model'

  describe "with a 17 characters long code" do
    before :all do
      @model.code = "18283849284728124"
      @model.valid?
    end

    it_behaves_like 'invalid model'
    it_behaves_like 'barcode with invalid code length'
  end

  describe "with a 7 characters long code" do
    before :all do
      @model.code = "8372786"
      @model.valid?
    end

    it_behaves_like 'valid model'
  end

  describe "with an 11 characters long code" do
    before :all do
      @model.code = "83727868754"
      @model.valid?
    end

    it_behaves_like 'invalid model'
    it_behaves_like 'barcode with invalid code length'
  end
end
