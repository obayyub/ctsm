class CreateVisitorsVisitors < ActiveRecord::Migration

  def up
    create_table :refinery_visitors do |t|
      t.string :parking
      t.text :other
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-visitors"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/visitors/visitors"})
    end

    drop_table :refinery_visitors

  end

end
