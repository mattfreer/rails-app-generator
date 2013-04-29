module Rails
  module Generators
    module Actions

      attr_accessor :stategies

      def initialize_templater
        @stategies = []
      end

      def execute_stategies
        stategies.each {|stategy| stategy.call }
      end

      def recipe(name)
        File.join File.dirname(__FILE__), 'recipes', "#{name}.rb"
      end

      def load_template(name, group)
        path = File.expand_path name, template_path(group)
        File.read path
      end

      def template_path(name)
        File.join(File.dirname(__FILE__), 'templates', name)
      end
    end
  end
end
