require_relative '../../spec_helper'
require_relative 'spec_helper'

shared_examples 'reservation with mismatched person name' do
  it 'has meaningful error message' do
    expect(@model.errors.on(:person_name)).to eq ['Person name does not match the confirmation']
  end
end

shared_examples 'reservation with mismatched seats number' do
  it 'has meaningful error message' do
    # Proc gets expanded here
    expect(@model.errors.on(:number_of_seats)).to eq ['Reservation requires confirmation for number_of_seats']
  end
end


describe 'DataMapper::Validations::Fixtures::Reservation' do
  before :all do
    DataMapper::Validations::Fixtures::Reservation.auto_migrate!

    @model = DataMapper::Validations::Fixtures::Reservation.new(:person_name                  => "Tyler Durden",
                                                             :person_name_confirmation     => "Tyler Durden",
                                                             :number_of_seats              => 2,
                                                             :seats_confirmation           => 2)
    expect(@model).to be_valid
  end

  describe "with matching person name and confirmation" do
    before :all do
      @model.person_name = "mismatch"
    end

    it_behaves_like 'invalid model'
    it_behaves_like 'reservation with mismatched person name'
  end


  describe "with a blank person name and confirmation" do
    before :all do
      @model.person_name = ""
    end

    it_behaves_like 'invalid model'
    it_behaves_like 'reservation with mismatched person name'
  end


  describe "with a missing person name and confirmation" do
    before :all do
      @model.person_name = nil
    end

    it_behaves_like 'invalid model'
    it_behaves_like 'reservation with mismatched person name'
  end


  describe "with mismatching number of seats and confirmation" do
    before :all do
      @model.number_of_seats  = -1
    end

    it_behaves_like 'invalid model'
    it_behaves_like 'reservation with mismatched seats number'
  end


  describe "with a blank number of seats and confirmation" do
    before :all do
      @model.number_of_seats = nil
    end

    it_behaves_like 'valid model'
  end
end
