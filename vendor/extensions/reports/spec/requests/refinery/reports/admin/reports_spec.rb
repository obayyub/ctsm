# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Reports" do
    describe "Admin" do
      describe "reports" do
        login_refinery_user

        describe "reports list" do
          before do
            FactoryGirl.create(:report, :authors => "UniqueTitleOne")
            FactoryGirl.create(:report, :authors => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.reports_admin_reports_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.reports_admin_reports_path

            click_link "Add New Report"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Authors", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Reports::Report.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Authors can't be blank")
              Refinery::Reports::Report.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:report, :authors => "UniqueTitle") }

            it "should fail" do
              visit refinery.reports_admin_reports_path

              click_link "Add New Report"

              fill_in "Authors", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Reports::Report.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:report, :authors => "A authors") }

          it "should succeed" do
            visit refinery.reports_admin_reports_path

            within ".actions" do
              click_link "Edit this report"
            end

            fill_in "Authors", :with => "A different authors"
            click_button "Save"

            page.should have_content("'A different authors' was successfully updated.")
            page.should have_no_content("A authors")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:report, :authors => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.reports_admin_reports_path

            click_link "Remove this report forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Reports::Report.count.should == 0
          end
        end

      end
    end
  end
end
