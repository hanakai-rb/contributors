# frozen_string_literal: true

require "fileutils"
require "rugged"

module HanakaiContributors
  module Operations
    module Git
      module Repository
        class AttributeCommits < HanakaiContributors::Operation
          include Deps["operations.git.repository.fetch_latest", "operations.git.repository.parse_commits", "repos.commit_repo", "repos.contributor_repo", "repos.project_repo"]

          def call(github_repository:)
            fetch_latest.call(github_repository: github_repository)

            parse_commits.call(github_repository: github_repository)

            project = project_repo.find_by_github_repository(github_repository)

            return unless project

            commits = commit_repo.by_project(project.id)

            contributors = {}

            commits.each do |commit|
              contributor = contributor_repo.find_or_create_by_email(commit.author_email, commit.author_name)
              commit_repo.update(commit.sha1, contributor_id: contributor.id)
              contributors[contributor.id] = 0 if contributors[contributor.id].nil?
              # Increment the commit count for this contributor in this batch
              contributors[contributor.id] += 1
            end

            contributors.each do |key, value|
              contributor = contributor_repo.find(key)
              next unless contributor

              contributor_repo.update_total_contributions(contributor.id)
            end

            commits
          end
        end
      end
    end
  end
end
