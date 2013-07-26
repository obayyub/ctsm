module Refinery
  module Publications
    module Admin
      class PublicationsController < ::Refinery::AdminController

        crudify :'refinery/publications/publication',
                :title_attribute => 'category', :xhr_paging => true

      end
    end
  end
end
