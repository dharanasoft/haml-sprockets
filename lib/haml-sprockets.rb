require "haml-sprockets/version"
require 'tilt'
require 'sprockets'
module Haml
  module Sprockets
    class Template < ::Tilt::Template
      def self.engine_initialized?
        true
      end
      def initialize_engine
      end
      def prepare
      end
      def evaluate(scope,locals,&block)
        haml_code = data.dup
        haml_code = haml_code.gsub(/\\/,"\\\\").gsub(/\'/,"\\\\'").gsub(/\n/,"\\n")
        "Haml('#{haml_code}', {escapeHtmlByDefault:true})"
      end
    end
  end
end
Sprockets::Engines
Sprockets.register_engine '.hamljs', Haml::Sprockets::Template
require 'haml-sprockets/engine' if defined?(Rails)
