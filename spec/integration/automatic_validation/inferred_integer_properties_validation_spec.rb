require_relative '../../spec_helper'
require_relative 'spec_helper'

describe "A model with an Integer property" do
  before :all do
    SailBoat.auto_migrate!

    @model = SailBoat.new
  end

  # success case
  describe "assigned to an integer" do
    before :all do
      @model.id = 1
    end

    it_behaves_like 'valid model'
  end

  describe "assigned a value coercible into an integer" do
    before :all do
      @model.id = 1.0
    end

    it_behaves_like 'valid model'
  end

  describe "assigned a value not coercible into an integer" do
    before :all do
      @model.id = "foo"
    end

    it "is invalid" do
      expect(@model).not_to be_valid
    end

    it "has a meaningful default error message" do
      expect(@model.errors.on(:id)).to eq [ 'Id must be an integer' ]
    end
  end

  describe "assigned to a too-small integer" do
    before :all do
      @model.id = 0
    end

    it "is invalid" do
      expect(@model).not_to be_valid
    end

    it "has a meaningful default error message" do
      expect(@model.errors.on(:id)).to eq [ 'Id must be greater than or equal to 1' ]
    end
  end

  describe "assigned to a too-large integer" do
    before :all do
      @model.id = 11
    end

    it "is invalid" do
      expect(@model).not_to be_valid
    end

    it "has a meaningful default error message" do
      expect(@model.errors.on(:id)).to eq [ 'Id must be less than or equal to 10' ]
    end
  end

end
