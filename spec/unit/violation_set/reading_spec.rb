# -*- coding: utf-8 -*-
require 'spec_helper'

shared_examples 'a validation error reader' do
  context 'and that property has no associated errors' do
    it 'should return an empty array' do
      @errors[@property].should == []
    end
  end
  context 'and that property has associated error(s)' do
    it 'should return a non empty array' do
      @errors.add(@property.to_sym, 'invalid')
      @errors[@property].should_not be_empty
    end
  end
end

describe 'DataMapper::Validations::ViolationSet' do
  describe '[]' do
    describe 'when passing the argument as a String' do
      before(:each) do
        @errors   = DataMapper::Validations::ViolationSet.new(Object.new)
        @property = 'name'
      end
      it_behaves_like 'a validation error reader'
    end
    describe 'when passing the argument as a Symbol' do
      before(:each) do
        @errors   = DataMapper::Validations::ViolationSet.new(Object.new)
        @property = :name
      end
      it_behaves_like 'a validation error reader'
    end
  end
end
