module Refinery
  module Visitors
    module Admin
      class VisitorsController < ::Refinery::AdminController

        crudify :'refinery/visitors/visitor',
                :title_attribute => 'parking', :xhr_paging => true

      end
    end
  end
end
