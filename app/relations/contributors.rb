# frozen_string_literal: true

module HanakaiContributors
  module Relations
    class Contributors < HanakaiContributors::DB::Relation
      schema :contributors, infer: true do
        associations do
          has_many :commits
        end
      end
    end
  end
end
