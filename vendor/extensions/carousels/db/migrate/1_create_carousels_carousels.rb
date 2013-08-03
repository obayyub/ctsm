class CreateCarouselsCarousels < ActiveRecord::Migration

  def up
    create_table :refinery_carousels do |t|
      t.string :title
      t.string :description
      t.integer :picture_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-carousels"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/carousels/carousels"})
    end

    drop_table :refinery_carousels

  end

end
