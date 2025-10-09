# frozen_string_literal: true

module HanakaiContributors
  module Operations
    module App
      class ResetAppData < HanakaiContributors::Operation
        include Deps["repos.commit_repo", "repos.contributor_repo"]

        def call
          commit_repo.delete_all_yes_really!
          contributor_repo.delete_all_yes_really!
        end
      end
    end
  end
end
