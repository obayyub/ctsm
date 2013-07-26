module Refinery
  module Journals
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Journals

      engine_name :refinery_journals

      initializer "register refinerycms_journals plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "journals"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.journals_admin_journals_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/journals/journal',
            :title => 'authors'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Journals)
      end
    end
  end
end
