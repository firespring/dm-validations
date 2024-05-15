require_relative '../spec_helper'

describe 'DataMapper::Resource' do
  before :all do
    DataMapper::Validations::Fixtures::Barcode.destroy!

    @resource = DataMapper::Validations::Fixtures::Barcode.new
  end

  describe '#update' do
    describe 'when provided valid attributes' do
      before :all do
        @response = @resource.update(:code => 'a' * 10)
      end

      it 'returns true' do
        expect(@response).to be(true)
      end
    end

    describe 'when provided invalid attributes' do
      before :all do
        @response = @resource.update(:code => 'a' * 11)
      end

      it 'returns false' do
        expect(@response).to be(false)
      end

      it 'sets errors' do
        expect(@resource.errors.to_a).to eq [ [ 'Code must be at most 10 characters long' ] ]
      end
    end

    describe 'when provided invalid attributes and a context' do
      before :all do
        DataMapper::Validations::Fixtures::Organisation.destroy!
        DataMapper::Validations::Fixtures::Department.destroy!
        DataMapper::Validations::Fixtures::User.destroy!

        organization = DataMapper::Validations::Fixtures::Organisation.create(:name => 'Org 101', :domain => '101')
        dept         = DataMapper::Validations::Fixtures::Department.create(:name => 'accounting')

        attributes = {
          :organisation => organization,
          :user_name    => 'guy',
          :department   => dept,
        }

        # create a record that will be a dupe when User#update is executed below
        expect(DataMapper::Validations::Fixtures::User.create(attributes)).to be_saved

        @resource = DataMapper::Validations::Fixtures::User.create(attributes.merge(:user_name => 'other'))

        @response = @resource.update(attributes, :signing_up_for_department_account)
      end

      it 'returns false' do
        expect(@response).to be(false)
      end

      it 'sets errors' do
        expect(@resource.errors.to_a).to eq [ [ 'User name is already taken' ] ]
      end
    end
  end

  describe '#save' do
    before :all do
      @resource.code = 'a' * 10
      @resource.save
    end

    describe 'on a new, non-dirty resource' do
      it 'calls valid? once' do
        blank = DataMapper::Validations::Fixtures::Barcode.new
        blank.save
        expect(blank.valid_hook_call_count).to eq 1
      end
    end

    describe 'on a new, dirty resource' do
      it 'calls valid? once' do
        expect(@resource.valid_hook_call_count).to eq 1
      end
    end

    describe 'on a saved, non-dirty resource' do
      before :all do
        # reload the resource
        @resource = @resource.model.get(*@resource.key)
        @resource.save
      end

      it 'does not call valid?' do
        expect(@resource.valid_hook_call_count.to_i).to eq 0
      end
    end

    describe 'on a saved, dirty resource' do
      before :all do
        # reload the resource
        @resource = @resource.model.get(*@resource.key)
        @resource.code = 'b' * 10
        @resource.save
      end

      it 'calls valid? once' do
        expect(@resource.valid_hook_call_count).to eq 1
      end
    end
  end
end
