# frozen_string_literal: true

module HanakaiContributors
  module Relations
    class Organizations < HanakaiContributors::DB::Relation
      schema :organizations, infer: true
    end
  end
end
