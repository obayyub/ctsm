require 'spec_helper'

module Refinery
  module Journals
    describe Journal do
      describe "validations" do
        subject do
          FactoryGirl.create(:journal,
          :authors => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:authors) { should == "Refinery CMS" }
      end
    end
  end
end
