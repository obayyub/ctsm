require 'spec_helper'

module Refinery
  module Conferences
    describe Conference do
      describe "validations" do
        subject do
          FactoryGirl.create(:conference,
          :author => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:author) { should == "Refinery CMS" }
      end
    end
  end
end
