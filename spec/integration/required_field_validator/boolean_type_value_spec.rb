require_relative '../../spec_helper'
require_relative 'spec_helper'

describe 'required_field_validator/boolean_type_value_spec' do

  # keep in mind any ScmOperation has a default value for brand property
  # so it is used
  describe 'GitOperation' do
    before :all do
      GitOperation.auto_migrate!
    end

    before do
      @operation = GitOperation.new(:network_connection => true,
                                    :clean_working_copy => true,
                                    :message            => "I did it! I did it!! Hell yeah!!!")
    end

    describe "without operation name" do
      before do
        @operation.name = nil
      end
      it_behaves_like 'unnamed SCM operation'
    end



    describe "without network connection" do
      before do
        # now note that false make sense from readability
        # point of view but is incorrect from validator
        # point of view ;)
        @operation.network_connection = nil
      end

      it "is valid for committing" do
        expect(@operation).to be_valid_for_committing
        expect(@operation.errors.on(:network_connection)).to be_nil
      end

      it "is not valid for pushing" do
        expect(@operation).not_to be_valid_for_pushing
        # Note: the previous API supported error messages as Hashes (context)
        #   I will remove that capability, such that a Rule only stores the
        #   message for the context to which the Rule is bound
        #   This will provide the same information, but with a simpler API
        # @operation.errors.on(:network_connection).
        #   expect(first).to eq 'though git is advanced, it cannot push without network connectivity'
        @operation.errors.on(:network_connection).
          expect(first[:pushing]).to eq 'though git is advanced, it cannot push without network connectivity'
      end

      it "is not valid for pulling" do
        expect(@operation).not_to be_valid_for_pulling
        # NOTE: See previous spec, above
        @operation.errors.on(:network_connection).
          expect(first[:pulling]).to eq 'you must have network connectivity to pull from others'
        # @operation.errors.on(:network_connection).
        #   expect(first).to eq 'you must have network connectivity to pull from others'
      end

      it "is not valid in default context" do
        expect(@operation).not_to be_valid
      end
    end

    describe "with a network connection" do
      before do
        @operation.network_connection = false
      end

      it "is valid for committing" do
        expect(@operation).to be_valid_for_committing
      end

      it "is valid for pushing" do
        expect(@operation).to be_valid_for_pushing
      end

      it "is valid for pulling" do
        expect(@operation).to be_valid_for_pulling
      end

      it "is not valid in default context" do
        expect(@operation).not_to be_valid
      end
    end


    describe "WITHOUT a clean working copy" do
      before do
        @operation.clean_working_copy = nil
      end

      it "is valid for committing" do
        expect(@operation).to be_valid_for_committing
      end

      it "is valid for pushing" do
        expect(@operation).to be_valid_for_pushing
      end

      it "is not valid for pulling" do
        expect(@operation).not_to be_valid_for_pulling
      end

      it "is not valid in default context" do
        expect(@operation).not_to be_valid
      end
    end

    describe "with a clean working copy" do
      before do
        @operation.clean_working_copy = true
      end

      it "is valid for committing" do
        expect(@operation).to be_valid_for_committing
      end

      it "is valid for pushing" do
        expect(@operation).to be_valid_for_pushing
      end

      it "is valid for pulling" do
        expect(@operation).to be_valid_for_pulling
      end

      it "is not valid in default context" do
        expect(@operation).not_to be_valid
      end
    end
  end


  describe 'SubversionOperation' do
    before do
      SubversionOperation.auto_migrate!

      @operation = SubversionOperation.new :name    => "ci", :network_connection => true,
                                           :message => "v1.5.8", :clean_working_copy => true
    end

    describe "without operation name" do
      before do
        @operation.name = nil
      end
      it_behaves_like 'unnamed SCM operation'
    end

    describe "without network connection" do
      before do
        @operation.network_connection = nil
      end

      it "virtually useless" do
        expect(@operation).not_to be_valid_for_committing
        expect(@operation).not_to be_valid_for_log_viewing
      end
    end
  end


end
