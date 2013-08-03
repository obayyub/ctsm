module Refinery
  module Carousels
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Carousels

      engine_name :refinery_carousels

      initializer "register refinerycms_carousels plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "carousels"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.carousels_admin_carousels_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/carousels/carousel'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Carousels)
      end
    end
  end
end
