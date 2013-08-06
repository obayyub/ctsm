# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "CtsmHomes" do
    describe "Admin" do
      describe "ctsm_homes" do
        login_refinery_user

        describe "ctsm_homes list" do
          before do
            FactoryGirl.create(:ctsm_home, :title => "UniqueTitleOne")
            FactoryGirl.create(:ctsm_home, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.ctsm_homes_admin_ctsm_homes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.ctsm_homes_admin_ctsm_homes_path

            click_link "Add New Ctsm Home"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::CtsmHomes::CtsmHome.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::CtsmHomes::CtsmHome.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:ctsm_home, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.ctsm_homes_admin_ctsm_homes_path

              click_link "Add New Ctsm Home"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::CtsmHomes::CtsmHome.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:ctsm_home, :title => "A title") }

          it "should succeed" do
            visit refinery.ctsm_homes_admin_ctsm_homes_path

            within ".actions" do
              click_link "Edit this ctsm home"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:ctsm_home, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.ctsm_homes_admin_ctsm_homes_path

            click_link "Remove this ctsm home forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::CtsmHomes::CtsmHome.count.should == 0
          end
        end

      end
    end
  end
end
