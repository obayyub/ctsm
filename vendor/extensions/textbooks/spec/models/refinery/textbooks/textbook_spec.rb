require 'spec_helper'

module Refinery
  module Textbooks
    describe Textbook do
      describe "validations" do
        subject do
          FactoryGirl.create(:textbook,
          :authors => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:authors) { should == "Refinery CMS" }
      end
    end
  end
end
