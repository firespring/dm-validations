require_relative '../../spec_helper'
require_relative 'spec_helper'

describe 'DataMapper::Validations::Fixtures::Kayak' do
  before :all do
    DataMapper::Validations::Fixtures::Kayak.auto_migrate!

    @kayak = DataMapper::Validations::Fixtures::Kayak.new
    expect(@kayak).to be_valid_for_sale
  end

  describe "with salesman being non blank" do
    before :all do
      @kayak.salesman = 'Joe'
    end

    it "is invalid" do
      expect(@kayak).not_to be_valid_for_sale
    end

    it "has meaningful error message" do
      expect(@kayak.errors.on(:salesman)).to eq [ 'Salesman must be absent' ]
    end
  end


  describe "with salesman being nil" do
    before :all do
      @kayak.salesman = nil
    end

    it "is valid" do
      expect(@kayak).to be_valid_for_sale
    end

    it "has no error messages" do
      expect(@kayak.errors.on(:salesman)).to be_nil
    end
  end


  describe "with salesman being an empty string" do
    before :all do
      @kayak.salesman = ''
    end

    it "is valid" do
      expect(@kayak).to be_valid_for_sale
    end

    it "has no error messages" do
      expect(@kayak.errors.on(:salesman)).to be_nil
    end
  end


  describe "with salesman being a string of white spaces" do
    before :all do
      @kayak.salesman = '    '
    end

    it "is valid" do
      expect(@kayak).to be_valid_for_sale
    end

    it "has no error messages" do
      expect(@kayak.errors.on(:salesman)).to be_nil
    end
  end
end


describe 'DataMapper::Validations::Fixtures::Pirogue' do
  before :all do
    DataMapper::Validations::Fixtures::Pirogue.auto_migrate!

    @kayak = DataMapper::Validations::Fixtures::Pirogue.new
    expect(@kayak).not_to be_valid_for_sale
  end

  describe "by default" do
    it "is invalid" do
      expect(@kayak).not_to be_valid_for_sale
    end

    it "has meaningful error message" do
      expect(@kayak.errors.on(:salesman)).to eq [ 'Salesman must be absent' ]
    end
  end
end
