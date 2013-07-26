module Refinery
  module Journals
    module Admin
      class JournalsController < ::Refinery::AdminController

        crudify :'refinery/journals/journal',
                :title_attribute => 'authors', :xhr_paging => true

      end
    end
  end
end
