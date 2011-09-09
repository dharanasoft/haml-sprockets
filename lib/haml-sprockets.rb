require "haml-sprockets/version"
require 'tilt'
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
        haml_code = haml_code.gsub(/\\/,"\\\\").gsub(/\'/,"\\'").gsub(/\n/,"\\n")
        "Haml('#{haml_code}')"
      end
    end
  end
end
require "haml-sprockets/engine" if defined?(Rails)
