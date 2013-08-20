module Refinery
  module Courses
    class Course < Refinery::Core::BaseModel
      self.table_name = 'refinery_courses'

      attr_accessible :title, :description, :link, :position

      acts_as_indexed :fields => [:title, :description, :link]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
