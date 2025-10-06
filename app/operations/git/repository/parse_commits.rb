# frozen_string_literal: true

require "fileutils"
require "rugged"

module HanakaiContributors
  module Operations
    module Git
      module Repository
        class ParseCommits < HanakaiContributors::Operation
          include Deps["operations.git.repository.fetch_latest", "repos.commit_repo", "repos.project_repo"]

          def call(github_repository:)
            fetch_latest.call(github_repository: github_repository)

            repo_path = repository_location.join(github_repository)
            git_repo = Rugged::Repository.new(repo_path.to_s)

            project = project_repo.find_by_github_repository(github_repository)
            return [] unless project

            commits = commits(git_repo).map do |rugged_commit|
              commit_repo.create_from_rugged_commit(rugged_commit, project_id: project.id, organization_id: project.organization_id)
            end

            return commits
          end

          private

          def commits(git_repo)
            git_repo.walk(git_repo.head.target_id, Rugged::SORT_DATE)
          end

          def repository_location
            tmp_dir = Hanami.app.root.join("tmp", "repositories")
            FileUtils.mkdir_p(tmp_dir) unless File.exist?(tmp_dir)
            tmp_dir
          end
        end
      end
    end
  end
end
