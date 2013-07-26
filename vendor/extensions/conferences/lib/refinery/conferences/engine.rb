module Refinery
  module Conferences
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Conferences

      engine_name :refinery_conferences

      initializer "register refinerycms_conferences plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "conferences"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.conferences_admin_conferences_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/conferences/conference',
            :title => 'author'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Conferences)
      end
    end
  end
end
