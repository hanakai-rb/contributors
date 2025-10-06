# frozen_string_literal: true

module HanakaiContributors
  module Relations
    class Projects < HanakaiContributors::DB::Relation
      schema :projects, infer: true do
        associations do
          belongs_to :organization
        end
      end
    end
  end
end
