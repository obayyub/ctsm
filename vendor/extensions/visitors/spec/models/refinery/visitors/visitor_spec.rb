require 'spec_helper'

module Refinery
  module Visitors
    describe Visitor do
      describe "validations" do
        subject do
          FactoryGirl.create(:visitor,
          :parking => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:parking) { should == "Refinery CMS" }
      end
    end
  end
end
