module Refinery
  module Reports
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Reports

      engine_name :refinery_reports

      initializer "register refinerycms_reports plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "reports"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.reports_admin_reports_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/reports/report',
            :title => 'authors'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Reports)
      end
    end
  end
end
