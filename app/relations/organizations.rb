# frozen_string_literal: true

module HanakaiContributors
  module Relations
    class Organizations < HanakaiContributors::DB::Relation
      schema :organizations, infer: true do
        associations do
          has_many :projects
          has_many :commits
          has_many :contributors, through: :commits
        end
      end
    end
  end
end
