require_relative '../../spec_helper'

describe 'DataMapper::Validations::ViolationSet#respond_to?' do

  subject { DataMapper::Validations::ViolationSet.new(Object.new) }

  it 'looks for the method in self' do
    expect(subject).to respond_to(:full_messages)
  end

  it 'delegates lookup to the underlying errors hash' do
    expect(subject).to respond_to(:size)
  end

end
