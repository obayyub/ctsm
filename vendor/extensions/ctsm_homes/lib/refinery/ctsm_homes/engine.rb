module Refinery
  module CtsmHomes
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::CtsmHomes

      engine_name :refinery_ctsm_homes

      initializer "register refinerycms_ctsm_homes plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "ctsm_homes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.ctsm_homes_admin_ctsm_homes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/ctsm_homes/ctsm_home'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::CtsmHomes)
      end
    end
  end
end
