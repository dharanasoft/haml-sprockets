require 'haml-sprockets/version'
require 'tilt'
require 'sprockets'
require 'execjs'

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

      def evaluate(scope, locals, &block)
        haml_code = data.dup
        haml_code = haml_code.gsub(/\\/,"\\\\").gsub(/\'/,"\\\\'").gsub(/\n/,"\\n")

        haml_path = File.expand_path("../../vendor/assets/javascripts/haml.js", __FILE__)
        haml_lib = File.read(haml_path)
        context = ExecJS.compile(haml_lib)
        return context.eval("Haml.optimize(Haml.compile('#{haml_code}', {escapeHtmlByDefault: true}))")
      end
    end
  end
end

Sprockets::Engines
Sprockets.register_engine '.hamljs', Haml::Sprockets::Template
require 'haml-sprockets/engine' if defined?(Rails)
