class CreateTextbooksTextbooks < ActiveRecord::Migration

  def up
    create_table :refinery_textbooks do |t|
      t.string :authors
      t.string :title
      t.string :state
      t.integer :picture_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-textbooks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/textbooks/textbooks"})
    end

    drop_table :refinery_textbooks

  end

end
