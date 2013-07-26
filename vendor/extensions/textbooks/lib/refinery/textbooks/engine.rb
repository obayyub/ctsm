module Refinery
  module Textbooks
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Textbooks

      engine_name :refinery_textbooks

      initializer "register refinerycms_textbooks plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "textbooks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.textbooks_admin_textbooks_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/textbooks/textbook',
            :title => 'authors'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Textbooks)
      end
    end
  end
end
