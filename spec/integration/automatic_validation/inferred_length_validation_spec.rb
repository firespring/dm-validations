require_relative '../../spec_helper'
require_relative 'spec_helper'

describe 'SailBoat' do
  before :all do
    SailBoat.auto_migrate!

    @model      = SailBoat.new(:id => 1)
    expect(@model).to be_valid_for_length_test_1
  end


  describe "with a nil value on property that allows nil" do
    before :all do
      @model.allow_nil = nil
    end

    it "is valid" do
      expect(@model).to be_valid_for_nil_test
    end
  end


  describe "with 11 characters long description" do
    before :all do
      @model.description = 'ABCDEFGHIJK' #11
    end

    # validates_length_of is inferred from property's :length option
    it "is invalid" do
      expect(@model).not_to be_valid_for_length_test_1
      expect(@model.errors.on(:description)).to eq [ 'Description must be at most 10 characters long' ]
    end
  end


  describe "with 9 characters long description" do
    before :all do
      @model.description = 'ABCDEFGHI' # 9
    end

    # validates_length_of is inferred from property's :length option
    it_behaves_like 'valid model'
  end

  describe "with 2 character long note" do
    before :all do
      @model = SailBoat.new(:notes => "AB")
    end

    it "is valid" do
      expect(@model).to be_valid_for_length_test_2
    end
  end

  describe "with 10 character long note" do
    before :all do
      @model = SailBoat.new(:notes => "ABCDEFGHIJ")
    end

    it "is valid" do
      expect(@model).to be_valid_for_length_test_2
    end
  end

  describe "with 11 character long note" do
    before :all do
      @model = SailBoat.new(:notes => "ABCDEFGHIJK")
    end

    it "is invalid" do
      expect(@model).not_to be_valid_for_length_test_2
    end

    it "has a meaningful error message" do
      expect(@model.errors.on(:notes)).to eq [ 'Notes must be between 2 and 10 characters long' ]
    end
  end
end



describe 'DataMapper::Validations::Fixtures::SmsMessage' do
  before :all do
    DataMapper::Validations::Fixtures::SmsMessage.auto_migrate!

    @model = DataMapper::Validations::Fixtures::SmsMessage.new(:id => 10)
  end

  describe "with 2 character long note" do
    before :all do
      @model.body = "ab"
    end

    it_behaves_like 'valid model'
  end

  describe "with 10 character long note" do
    before :all do
      @model.body = "ABCDEFGHIJ"
    end

    it_behaves_like 'valid model'
  end

  describe "with 499 character long note" do
    before :all do
      @model.body = "a" * 499
    end

    it_behaves_like 'valid model'
  end

  describe "with 503 character long note" do
    before :all do
      @model.body = "a" * 503
    end

    it_behaves_like 'invalid model'

    it "has a meaningful error message" do
      expect(@model.errors.on(:body)).to eq [ 'Body must be between 1 and 500 characters long' ]
    end
  end

  describe 'with an infinitely long note' do
    before do
      @original = @model.class.properties[:body]
    end

    after do
      @model.class.property(@original.name, @original.class, @original.options)
    end

    it "raises when trying to set the upper bound of a property length range to Infinity" do
      expected_msg = 'Infinity is not a valid upper bound for a length range'
      expect {
        @model.class.property :body, String, :length => (1..1.0/0)
      }.to raise_error(ArgumentError, expected_msg)
    end
  end
end
