# frozen_string_literal: true

module HanakaiContributors
  module Views
    module Contributors
      module Commits
        class Index < HanakaiContributors::View
          expose :contributor
          expose :contributors # All contributors
          expose :commits
          expose :projects
        end
      end
    end
  end
end
