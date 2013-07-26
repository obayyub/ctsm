class CreateReportsReports < ActiveRecord::Migration

  def up
    create_table :refinery_reports do |t|
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
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-reports"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/reports/reports"})
    end

    drop_table :refinery_reports

  end

end
