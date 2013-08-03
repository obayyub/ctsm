require 'spec_helper'

module Refinery
  module Carousels
    describe Carousel do
      describe "validations" do
        subject do
          FactoryGirl.create(:carousel,
          :title => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS" }
      end
    end
  end
end
