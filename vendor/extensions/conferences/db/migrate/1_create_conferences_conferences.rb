class CreateConferencesConferences < ActiveRecord::Migration

  def up
    create_table :refinery_conferences do |t|
      t.string :author
      t.string :title
      t.string :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-conferences"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/conferences/conferences"})
    end

    drop_table :refinery_conferences

  end

end
