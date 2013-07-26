# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Journals" do
    describe "Admin" do
      describe "journals" do
        login_refinery_user

        describe "journals list" do
          before do
            FactoryGirl.create(:journal, :authors => "UniqueTitleOne")
            FactoryGirl.create(:journal, :authors => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.journals_admin_journals_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.journals_admin_journals_path

            click_link "Add New Journal"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Authors", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Journals::Journal.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Authors can't be blank")
              Refinery::Journals::Journal.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:journal, :authors => "UniqueTitle") }

            it "should fail" do
              visit refinery.journals_admin_journals_path

              click_link "Add New Journal"

              fill_in "Authors", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Journals::Journal.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:journal, :authors => "A authors") }

          it "should succeed" do
            visit refinery.journals_admin_journals_path

            within ".actions" do
              click_link "Edit this journal"
            end

            fill_in "Authors", :with => "A different authors"
            click_button "Save"

            page.should have_content("'A different authors' was successfully updated.")
            page.should have_no_content("A authors")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:journal, :authors => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.journals_admin_journals_path

            click_link "Remove this journal forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Journals::Journal.count.should == 0
          end
        end

      end
    end
  end
end
