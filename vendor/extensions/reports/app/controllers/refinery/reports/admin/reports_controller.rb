module Refinery
  module Reports
    module Admin
      class ReportsController < ::Refinery::AdminController

        crudify :'refinery/reports/report',
                :title_attribute => 'authors', :xhr_paging => true

      end
    end
  end
end
