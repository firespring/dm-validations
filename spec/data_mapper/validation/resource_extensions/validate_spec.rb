require_relative '../../../spec_helper'
require 'data_mapper/validation/resource_extensions'

describe DataMapper::Validation::ResourceExtensions, '#validate' do
  before :all do
    class Base
      include DataMapper::Resource

      property :id, Serial
      property :required, String, :required => true, :default => "value"

      belongs_to :parent,   "Parent", :child_key => [ :parent_id ], :required => false
      has n,     :children, "Child"
    end

    class Parent
      include DataMapper::Resource

      property :id, Serial
      property :required, String, :required => true, :default => "value"

      has 1, :base, "Base", :child_key => [ :parent_id ]
    end

    class Child
      include DataMapper::Resource

      property :id,       Serial
      property :required, String, :required => true, :default => "value"

      belongs_to :base, "Base", :child_key => [ :base_id ], :required => false
    end

    Base.finalize
    Parent.finalize
    Child.finalize
  end

  subject { Base.new(:parent => parent, :children => children) }

  context 'when self, parent(s) and child(ren) are valid' do
    let(:parent) { Parent.new }
    let(:children) { [ Child.new, Child.new ] }

    it 'does not append errors' do
      expect(subject.validate.errors).to be_empty
    end
  end

  context 'when a parent is invalid' do
    let(:parent) { Parent.new(:required => nil) }
    let(:children) { [ Child.new, Child.new ] }

    before { pending }

    it 'does append violations' do
      expect(subject.validate.errors).not_to be_empty
    end

    it 'appends a violation on :parent' do
      expect(subject.validate.errors.on(:parent)).not_to be_empty
    end

    it 'appends a single violation on :parent' do
      expect(subject.validate.errors.on(:parent).size).to eql(1)
    end
  end

  context 'when a child is invalid' do
    let(:parent) { Parent.new }
    let(:children) { [ Child.new, Child.new(:required => nil) ] }

    before { pending }

    it 'does append violations' do
      expect(subject.validate.errors).not_to be_empty
    end

    it 'appends a violation on :children' do
      expect(subject.validate.errors.on(:children)).not_to be_empty
    end

    it 'appends a single violation on :children' do
      expect(subject.validate.errors.on(:children).size).to eql(1)
    end
  end

  context 'when both children are invalid in the same way' do
    let(:parent) { Parent.new }
    let(:children) { [ Child.new(:required => nil), Child.new(:required => nil) ] }

    before { pending }

    it 'does append violations' do
      expect(subject.validate.errors).not_to be_empty
    end

    it 'appends a single violation on :children' do
      expect(subject.validate.errors.on(:children).size).to eql(1)
    end
  end

end
