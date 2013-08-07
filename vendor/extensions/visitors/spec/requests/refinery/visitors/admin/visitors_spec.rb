# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Visitors" do
    describe "Admin" do
      describe "visitors" do
        login_refinery_user

        describe "visitors list" do
          before do
            FactoryGirl.create(:visitor, :parking => "UniqueTitleOne")
            FactoryGirl.create(:visitor, :parking => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.visitors_admin_visitors_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.visitors_admin_visitors_path

            click_link "Add New Visitor"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Parking", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Visitors::Visitor.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Parking can't be blank")
              Refinery::Visitors::Visitor.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:visitor, :parking => "UniqueTitle") }

            it "should fail" do
              visit refinery.visitors_admin_visitors_path

              click_link "Add New Visitor"

              fill_in "Parking", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Visitors::Visitor.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:visitor, :parking => "A parking") }

          it "should succeed" do
            visit refinery.visitors_admin_visitors_path

            within ".actions" do
              click_link "Edit this visitor"
            end

            fill_in "Parking", :with => "A different parking"
            click_button "Save"

            page.should have_content("'A different parking' was successfully updated.")
            page.should have_no_content("A parking")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:visitor, :parking => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.visitors_admin_visitors_path

            click_link "Remove this visitor forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Visitors::Visitor.count.should == 0
          end
        end

      end
    end
  end
end
