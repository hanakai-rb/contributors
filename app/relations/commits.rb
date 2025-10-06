# frozen_string_literal: true

module HanakaiContributors
  module Relations
    class Commits < HanakaiContributors::DB::Relation
      schema :commits, infer: true do
        associations do
          belongs_to :project
          belongs_to :organization
          belongs_to :contributor
        end
      end
    end
  end
end
