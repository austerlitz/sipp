module SIPP
  class Engine < ::Rails::Engine
    isolate_namespace SIPP
    initializer 'SIPP', before: :load_config_initializers do
      Rails.application.config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
    end
  end
end