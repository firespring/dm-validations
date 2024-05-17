require_relative '../../spec_helper'
require_relative 'spec_helper'

describe 'DataMapper::Validations::Fixtures::BasketballCourt' do
  before :all do
    DataMapper::Validations::Fixtures::BasketballCourt.auto_migrate!

    @model = DataMapper::Validations::Fixtures::BasketballCourt.valid_instance
    @model.valid?
  end

  it_behaves_like 'valid model'


  describe "with length of 15.0" do
    before :all do
      @model.length = 15.0
      @model.valid?
    end

    it_behaves_like 'valid model'
  end

  describe 'with length of 14.0' do
    before :all do
      @model.length = 14.0
      @model.valid?
    end

    it_behaves_like 'invalid model'

    it "has a meaningful error message" do
      expect(@model.errors.on(:length)).to eq [ 'Length must be greater than or equal to 15.0' ]
    end
  end
end
