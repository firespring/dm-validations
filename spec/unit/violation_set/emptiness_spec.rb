# -*- coding: utf-8 -*-
require_relative '../../spec_helper'

describe 'DataMapper::Validations::ViolationSet' do
  before :all do
    @model = DataMapper::Validations::ViolationSet.new(Object.new)
  end

  describe "initially" do
    it "is empty" do
      expect(@model).to be_empty
    end
  end

  # Not sure if this is worth having at all,
  # just keeping old spec suite bits in place
  # if they make no harm — MK
  describe "after enquiry" do
    before :all do
      @model.on(:property)
    end

    it "is still empty" do
      expect(@model).to be_empty
    end
  end


  describe "after errors being added" do
    before :all do
      @model.add(:property, "can't be valid, no way")
    end

    it "is no longer empty" do
      expect(@model).not_to be_empty
    end
  end
end
