module Refinery
  module Textbooks
    module Admin
      class TextbooksController < ::Refinery::AdminController

        crudify :'refinery/textbooks/textbook',
                :title_attribute => 'authors', :xhr_paging => true

      end
    end
  end
end
