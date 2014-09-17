require 'haml-sprockets/version'
require 'tilt'
require 'sprockets'
require 'execjs'

module Haml
  module Sprockets
    class Template < ::Tilt::Template
      self.default_mime_type = 'application/javascript'

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

        # Haml("...") returns a function. We convert it to a string
        # so that the browser can convert it back into a function.
        context.eval "Haml('#{haml_code}').toString()"
      end
    end
  end
end

Sprockets::Engines
Sprockets.register_engine '.hamljs', Haml::Sprockets::Template
require 'haml-sprockets/engine' if defined?(Rails)
