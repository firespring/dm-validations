require_relative '../../spec_helper'
require_relative 'spec_helper'

describe 'DataMapper::Validations::Fixtures::BasketballCourt' do
  before :all do
    DataMapper::Validations::Fixtures::BasketballCourt.auto_migrate!

    @model = DataMapper::Validations::Fixtures::BasketballCourt.valid_instance
    @model.valid?
  end

  it_behaves_like 'valid model'


  describe "with three point line distance of 6.8" do
    before :all do
      @model.three_point_line_distance = 6.8
      @model.valid?
    end

    it_behaves_like 'valid model'
  end


  describe "with three point line distance of 10.0" do
    before :all do
      @model.three_point_line_distance = 10.0
      @model.valid?
    end

    it_behaves_like 'invalid model'

    it "has a meaningful error message" do
      expect(@model.errors.on(:three_point_line_distance)).to eq [ 'Three point line distance must be less than 7.24' ]
    end
  end
end
