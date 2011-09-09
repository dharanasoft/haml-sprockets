module Haml
  module Sprockets
    class Engine < ::Rails::Engine
      config.after_initialize do
        Rails.application.assets.register_engine '.hamljs', Haml::Sprockets::Template
      end
    end
  end
end
