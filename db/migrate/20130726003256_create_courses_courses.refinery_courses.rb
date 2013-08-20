# This migration comes from refinery_courses (originally 1)
class CreateCoursesCourses < ActiveRecord::Migration

  def up
    create_table :refinery_courses do |t|
      t.string :title
      t.text :content
      t.string :link
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-courses"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/courses/courses"})
    end

    drop_table :refinery_courses

  end

end
