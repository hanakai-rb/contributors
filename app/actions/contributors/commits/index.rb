# frozen_string_literal: true

module HanakaiContributors
  module Actions
    module Contributors
      module Commits
        class Index < HanakaiContributors::Action
          include Deps["repos.contributor_repo", "repos.commit_repo", "repos.project_repo"]

          def handle(request, response)
            contributor = contributor_repo.find_by_slug!(request.params[:slug])
            commits = commit_repo.by_contributor(contributor.id)

            response[:contributor] = contributor
            response[:commits] = commits
            response[:projects] = project_repo.all
          end
        end
      end
    end
  end
end
