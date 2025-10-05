# frozen_string_literal: true

module HanakaiContributors
  module Views
    class Context < Hanami::View::Context
      def organization_to_title(org)
        case org
        when "hanakai"
          "Hanakai Contributors"
        when "hanami"
          "Hanami Contributors"
        when "dry"
          "Dry Contributors"
        when "rom"
          "ROM Contributors"
        else
          "Contributors"
        end
      end
    end
  end
end
