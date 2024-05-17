require_relative '../../spec_helper'

describe 'DataMapper::Validations::Rule' do
  describe "when types and fields are equal" do
    it "returns true" do
      DataMapper::Validations::Rule::Presence.new(:name).
        is_expected.to eq DataMapper::Validations::Rule::Presence.new(:name)
    end
  end


  describe "when types differ" do
    it "returns false" do
      DataMapper::Validations::Rule::Presence.new(:name).
        is_expected.not_to eq DataMapper::Validations::Rule::Uniqueness.new(:name)
    end
  end


  describe "when property names differ" do
    it "returns false" do
      DataMapper::Validations::Rule::Presence.new(:first_name).
        is_expected.not_to eq DataMapper::Validations::Rule::Presence.new(:last_name)
    end
  end
end
