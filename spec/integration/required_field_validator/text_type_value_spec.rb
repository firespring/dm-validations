require_relative 'spec_helper'
require_relative 'spec_helper'

describe 'required_field_validator/text_type_value_spec' do

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

    describe "with empty message" do
      before do
        @operation.message = ""
      end

      it "is NOT valid for committing" do
        # empty string is not considered present for
        # a text value
        expect(@operation).not_to be_valid_for_committing

        # sanity check since this empty vs blank vs nil
        # thing is a shaky ground
        @operation.message = "RUBY ON RAILS CAN SCALE NOW!!! w00t!!!"
        expect(@operation).to be_valid_for_committing
      end

      it "IS valid for pushing" do
        expect(@operation).to be_valid_for_pushing
      end

      it "IS valid for pulling" do
        expect(@operation).to be_valid_for_pulling
      end

      it "is not valid in default context" do
        expect(@operation).not_to be_valid
      end
    end
  end

end
