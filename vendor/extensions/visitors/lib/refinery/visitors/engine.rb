module Refinery
  module Visitors
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Visitors

      engine_name :refinery_visitors

      initializer "register refinerycms_visitors plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "visitors"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.visitors_admin_visitors_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/visitors/visitor',
            :title => 'parking'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Visitors)
      end
    end
  end
end
