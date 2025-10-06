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
          "Rom Contributors"
        else
          "Hanakai Contributors"
        end
      end

      def organization_path(org)
        case org
        when "hanakai"
          "/hanakai"
        when "hanami"
          "/hanami"
        when "dry"
          "/dry"
        when "rom"
          "/rom"
        else
          "/"
        end
      end
    end
  end
end
