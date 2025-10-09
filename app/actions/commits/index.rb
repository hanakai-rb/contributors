# frozen_string_literal: true

module HanakaiContributors
  module Actions
    module Commits
      class Index < HanakaiContributors::Action
        include Deps["repos.commit_repo", "repos.project_repo", "repos.contributor_repo",
          all_view: "views.contributors.commits.index"
        ]

        def handle(request, response)
          commits = commit_repo.all_by_descending_date
          projects = project_repo.all
          contributors = contributor_repo.all

          response.render(
            all_view,
            commits: commits,
            projects: projects,
            contributors: contributors
          )
        end
      end
    end
  end
end
