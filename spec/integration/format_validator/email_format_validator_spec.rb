# encoding: UTF-8
require_relative '../../spec_helper'
require_relative 'spec_helper'

describe 'DataMapper::Validations::Fixtures::BillOfLading' do
  before :all do
    DataMapper::Validations::Fixtures::BillOfLading.auto_migrate!
  end

  def valid_attributes
    { :id => 1, :doc_no => 'A1234', :email => 'user@example.com', :url => 'http://example.com' }
  end

  @valid_email_addresses = [
        '+1~1+@example.com',
        '{_dave_}@example.com',
        '"[[ dave ]]"@example.com',
        'dave."dave"@example.com',
        'test@example.com',
        'test@example.co.uk',
        'test@example.com.br',
        '"J. P. \'s-Gravezande, a.k.a. The Hacker!"@example.com',
        'me@[187.223.45.119]',
        'someone@123.com',
        'simon&garfunkel@songs.com'].each do |email|

    describe "with email value of #{email} (RFC2822 compliant)" do
      before :all do
        @model = DataMapper::Validations::Fixtures::BillOfLading.new(valid_attributes.merge(:email => email))
      end

      it_behaves_like 'valid model'
    end
  end


  @invalid_email_addresses = [
        '-- dave --@example.com',
        '[dave]@example.com',
        '.dave@example.com',
        'Max@Job 3:14',
        'Job@Book of Job',
        'test@localhost',
        'J. P. \'s-Gravezande, a.k.a. The Hacker!@example.com',
        "test@example.com\nsomething after the newline"].each do |email|
    describe "with email value of #{email} (non RFC2822 compliant)" do
      before :all do
        @model = DataMapper::Validations::Fixtures::BillOfLading.new(valid_attributes.merge(:email => email))
      end

      it_behaves_like 'invalid model'
    end
  end

  describe "with valid email including unicode characters" do
    before :all do
      @model = DataMapper::Validations::Fixtures::BillOfLading.new(valid_attributes.merge(:email => 'pelé@gmail.com'))
    end

    if (RUBY_VERSION == '1.9.2' && RUBY_ENGINE == 'jruby') || RUBY_VERSION == '1.9.3'
      # Not supported on jruby 1.9 or 1.9.3 yet - see formats/email.rb
      it 'does not raise an error' do
        expect { @model.valid? }.not_to raise_error
      end
    else
      # Unicode emails not supported on MRI18
      unless !defined?(RUBY_ENGINE) && RUBY_VERSION == '1.8.7'
        it 'behaves like valid model' do
          expect(@model).to be_valid
        end
      end
    end
  end


  it 'has a pre-defined URL format' do
    bad = [ 'http:// example.com',
            'ftp://example.com',
            'http://.com',
            'http://',
            'test',
            '...'
          ]

    good = [
            'http://example.com',
            'http://www.example.com',
           ]

    bol = DataMapper::Validations::Fixtures::BillOfLading.new(valid_attributes.except(:url))
    expect(bol).not_to be_valid
    expect(bol.errors.on(:url)).to eq [ 'Url has an invalid format' ]

    bad.map do |e|
      bol.url = e
      bol.valid?
      expect(bol.errors.on(:url)).to eq [ 'Url has an invalid format' ]
    end

    good.map do |e|
      bol.url = e
      bol.valid?
      expect(bol.errors.on(:url)).to be_nil
    end

  end

  describe 'with a regexp' do
    before do
      @bol = DataMapper::Validations::Fixtures::BillOfLading.new(valid_attributes)
      expect(@bol).to be_valid
    end

    describe 'if matched' do
      before do
        @bol.username = 'a12345'
      end

      it 'validates' do
        expect(@bol).to be_valid
      end
    end

    describe 'if not matched' do
      before do
        @bol.username = '12345'
      end

      it 'does not validate' do
        expect(@bol).not_to be_valid
      end

      it 'sets an error message' do
        @bol.valid?
        expect(@bol.errors.on(:username)).to eq [ 'Username must have at least one letter' ]
      end
    end
  end
end
