module Refinery
  module Courses
    module Admin
      class CoursesController < ::Refinery::AdminController

        crudify :'refinery/courses/course', :xhr_paging => true

      end
    end
  end
end
