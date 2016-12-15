# Sometimes, we want to set options specific to layouts and views under certain circumstances.
#
# Here we provide a hash of layout options and expose a nice controller-level interface for overriding them.
# For example, we might call the following within a controller:
#
# `configure_layout show_sidebar: false, only: [:new, :show]`
#
# For further customisation, `if` and `unless` options can be passed in, e.g:
# This feature currently doesn't accept Proc objects as `if` and `unless` arguments, but it could be extended to do so.

module Concerns
  module LayoutOptions
    extend ActiveSupport::Concern

    # rubocop:disable Lint/UselessAssignment Rubocop gets confused with 'included' blocks in concerns
    included do
      class_attribute :defined_layout_options
      self.defined_layout_options = []

      helper_method :layout_options
      def layout_options
        applicable_options = self.class.defined_layout_options.select { |opts| layout_options_apply_to_action?(opts) }
        applicable_options.reduce({}, :merge)
      end

      private

      def layout_options_apply_to_action?(options_hash)
        action = action_name.to_sym

        return false if options_hash.key?(:except) && Array.wrap(options_hash[:except]).include?(action)
        return false if options_hash.key?(:only) && Array.wrap(options_hash[:only]).exclude?(action)
        return false if options_hash[:if].present? && !send(options_hash[:if])
        return false if options_hash[:unless].present? && send(options_hash[:unless])

        true
      end
    end

    module ClassMethods
      # Add the specified layout options to a new copy of the 'defined_layout_options' variable.
      def configure_layout(options = {})
        self.defined_layout_options = (defined_layout_options.dup << options)
      end
    end
  end
end
