module Refinery
  module CtsmHomes
    module Admin
      class CtsmHomesController < ::Refinery::AdminController

        crudify :'refinery/ctsm_homes/ctsm_home', :xhr_paging => true

      end
    end
  end
end
