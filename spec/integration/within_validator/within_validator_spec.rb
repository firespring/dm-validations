require_relative '../../spec_helper'
require_relative 'spec_helper'

describe 'DataMapper::Validations::Fixtures::PhoneNumber' do
  before :all do
    DataMapper::Validations::Fixtures::PhoneNumber.auto_migrate!

    @model = DataMapper::Validations::Fixtures::PhoneNumber.new(:type_of_number => 'cell')
    expect(@model).to be_valid
  end

  describe "with type of number set to 'home'" do
    before :all do
      @model.type_of_number = 'home'
    end

    it_behaves_like 'valid model'
  end


  describe "with type of number set to 'cell'" do
    before :all do
      @model.type_of_number = 'cell'
    end

    it_behaves_like 'valid model'
  end


  describe "with type of number set to 'work'" do
    before :all do
      @model.type_of_number = 'home'
    end

    it_behaves_like 'valid model'
  end


  describe "with type of number set to 'fax'" do
    before :all do
      @model.type_of_number = 'fax'
    end

    it_behaves_like 'invalid model'

    it "has meaningful error message on invalid property" do
      expect(@model.errors.on(:type_of_number)).to eq [ 'Should be one of: home, cell or work' ]
    end
  end
end



describe 'DataMapper::Validations::Fixtures::MathematicalFunction' do
  before :all do
    DataMapper::Validations::Fixtures::MathematicalFunction.auto_migrate!

    @model = DataMapper::Validations::Fixtures::MathematicalFunction.new(:input => 2, :output => -2)
    expect(@model).to be_valid
  end

  describe "with input = 0" do
    before :all do
      @model.input = 0
    end

    it_behaves_like 'invalid model'

    it "notices 'greater than or equal to 1' in the error message" do
      expect(@model.errors.on(:input)).to eq [ 'Input must be greater than or equal to 1' ]
    end
  end

  describe "with input = -10" do
    before :all do
      @model.input = -10
    end

    it_behaves_like 'invalid model'

    it "notices 'greater than or equal to 1' in the error message" do
      expect(@model.errors.on(:input)).to eq [ 'Input must be greater than or equal to 1' ]
    end
  end

  describe "with input = -Infinity" do
    before :all do
      @model.input = -(1.0/0)
    end

    it_behaves_like 'invalid model'

    it "notices 'greater than or equal to 1' in the error message" do
      expect(@model.errors.on(:input)).to eq [ 'Input must be greater than or equal to 1' ]
    end
  end

  describe "with input = 10" do
    before :all do
      @model.input = 10
    end

    it_behaves_like 'valid model'
  end


  describe "with input = Infinity" do
    before :all do
      @model.input = (1.0/0)
    end

    it_behaves_like 'valid model'
  end


  #
  # Function range
  #

  describe "with output = 0" do
    before :all do
      @model.output = 0
    end

    it_behaves_like 'valid model'
  end

  describe "with output = -10" do
    before :all do
      @model.output = -10
    end

    it_behaves_like 'valid model'
  end

  describe "with output = -Infinity" do
    before :all do
      @model.output = -(1.0/0)
    end

    it_behaves_like 'valid model'
  end

  describe "with output = 10" do
    before :all do
      @model.output = 10
    end

    it_behaves_like 'invalid model'

    it "uses overriden error message" do
      expect(@model.errors.on(:output)).to eq [ 'Negative values or zero only, please' ]
    end
  end


  describe "with output = Infinity" do
    before :all do
      @model.output = (1.0/0)
    end

    it_behaves_like 'invalid model'

    it "uses overriden error message" do
      expect(@model.errors.on(:output)).to eq [ 'Negative values or zero only, please' ]
    end
  end
end
