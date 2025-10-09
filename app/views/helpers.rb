# auto_register: false
# frozen_string_literal: true

module HanakaiContributors
  module Views
    module Helpers
      # Add your view helpers here
      def truncate(text, length: 100)
        return text if text.length <= length

        "#{text[0, length]}..."
      end
    end
  end
end
