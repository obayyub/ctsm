class RemoveContentFromCoursesCourses < ActiveRecord::Migration
  def up
    remove_column :refinery_courses, :content
  end

  def down
    add_column :refinery_courses, :content, :string
  end
end
