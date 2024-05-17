require_relative '../../spec_helper'
require_relative 'spec_helper'

describe 'DataMapper::Validations::Fixtures::Jabberwock' do
  before :all do
    DataMapper::Validations::Fixtures::Jabberwock.auto_migrate!

    @model = DataMapper::Validations::Fixtures::Jabberwock.new
  end

  describe "without snickersnack" do
    before :all do
      @model.snickersnack = nil
    end

    it_behaves_like 'invalid model'

    it "has custom error message" do
      expect(@model.errors.on(:snickersnack)).to eq [ 'worble warble' ]
    end
  end
end
