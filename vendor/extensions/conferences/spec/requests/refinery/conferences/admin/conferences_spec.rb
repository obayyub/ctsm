# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Conferences" do
    describe "Admin" do
      describe "conferences" do
        login_refinery_user

        describe "conferences list" do
          before do
            FactoryGirl.create(:conference, :author => "UniqueTitleOne")
            FactoryGirl.create(:conference, :author => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.conferences_admin_conferences_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.conferences_admin_conferences_path

            click_link "Add New Conference"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Author", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Conferences::Conference.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Author can't be blank")
              Refinery::Conferences::Conference.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:conference, :author => "UniqueTitle") }

            it "should fail" do
              visit refinery.conferences_admin_conferences_path

              click_link "Add New Conference"

              fill_in "Author", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Conferences::Conference.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:conference, :author => "A author") }

          it "should succeed" do
            visit refinery.conferences_admin_conferences_path

            within ".actions" do
              click_link "Edit this conference"
            end

            fill_in "Author", :with => "A different author"
            click_button "Save"

            page.should have_content("'A different author' was successfully updated.")
            page.should have_no_content("A author")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:conference, :author => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.conferences_admin_conferences_path

            click_link "Remove this conference forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Conferences::Conference.count.should == 0
          end
        end

      end
    end
  end
end
