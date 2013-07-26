# This migration comes from refinery_journals (originally 1)
class CreateJournalsJournals < ActiveRecord::Migration

  def up
    create_table :refinery_journals do |t|
      t.string :authors
      t.string :title
      t.string :content
      t.integer :pdf_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-journals"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/journals/journals"})
    end

    drop_table :refinery_journals

  end

end
