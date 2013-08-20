class AddDescriptionFromCoursesCourses < ActiveRecord::Migration
  def change
    add_column :refinery_courses, :description, :text
  end
end
