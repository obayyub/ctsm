# This migration comes from refinery_ctsm_homes (originally 1)
class CreateCtsmHomesCtsmHomes < ActiveRecord::Migration

  def up
    create_table :refinery_ctsm_homes do |t|
      t.string :title
      t.string :description
      t.integer :picture_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-ctsm_homes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/ctsm_homes/ctsm_homes"})
    end

    drop_table :refinery_ctsm_homes

  end

end
