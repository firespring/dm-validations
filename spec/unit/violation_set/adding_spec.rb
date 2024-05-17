# -*- coding: utf-8 -*-
require_relative '../../spec_helper'

describe 'DataMapper::Validations::ViolationSet' do
  before :all do
    @model = DataMapper::Validations::ViolationSet.new(Object.new)
  end

  describe "after first error being added" do
    before :all do
      @model.add(:property, "can't be valid, no way")
    end

    it "is no longer empty" do
      expect(@model).not_to be_empty
    end

    it "adds error message to list of errors for given property name" do
      expect(@model.on(:property)).to eq ["can't be valid, no way"]
    end
  end


  describe "after second error being added" do
    before :all do
      @model.add(:property, "can't be valid, no way")
      @model.add(:property, "something else is wrong")
    end

    it "is no longer empty" do
      expect(@model).not_to be_empty
    end

    it "appends error message to list of errors for given property name" do
      expect(@model.on(:property)).to eq ["can't be valid, no way", "something else is wrong"]
    end
  end


  describe "when duplicate error being added" do
    before :all do
      @model.add(:property, "can't be valid, no way")
      @model.add(:property, "can't be valid, no way")
    end

    it "is no longer empty" do
      expect(@model).not_to be_empty
    end

    it "DOES NOT allow duplication" do
      expect(@model.on(:property)).to eq ["can't be valid, no way"]
    end
  end
end
