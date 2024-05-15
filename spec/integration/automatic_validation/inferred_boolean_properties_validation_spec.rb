require_relative '../../spec_helper'
require_relative 'spec_helper'

describe "A model with a Boolean property" do
  before :all do
    @model = HasNullableBoolean.new(:id => 1)
  end

  describe "assigned a true" do
    before :all do
      @model.bool = true
    end

    it_behaves_like 'valid model'
  end

  describe "assigned a false" do
    before :all do
      @model.bool = false
    end

    it_behaves_like 'valid model'
  end

  describe "assigned a nil" do
    before :all do
      @model.bool = nil
    end

    it_behaves_like 'valid model'
  end
end

describe "A model with a required Boolean property" do
  before :all do
    @model = HasRequiredBoolean.new(:id => 1)
  end

  describe "assigned a true" do
    before :all do
      @model.bool = true
    end

    it_behaves_like 'valid model'
  end

  describe "assigned a false" do
    before :all do
      @model.bool = false
    end

    it_behaves_like 'valid model'
  end

  describe "assigned a nil" do
    before :all do
      @model.bool = nil
    end

    it_behaves_like 'invalid model'

    it "has a meaningful error message" do
      expect(@model.errors.on(:bool)).to eq [ 'Bool must not be nil' ]
    end
  end
end

describe "A model with a required paranoid Boolean property" do
  before :all do
    @model = HasRequiredParanoidBoolean.new(:id => 1)
  end

  describe "assigned a true" do
    before :all do
      @model.bool = true
    end

    it_behaves_like 'valid model'
  end

  describe "assigned a false" do
    before :all do
      @model.bool = false
    end

    it_behaves_like 'valid model'
  end

  describe "assigned a nil" do
    before :all do
      @model.bool = nil
    end

    it_behaves_like 'invalid model'

    it "has a meaningful error message" do
      expect(@model.errors.on(:bool)).to eq [ 'Bool must not be nil' ]
    end
  end
end
