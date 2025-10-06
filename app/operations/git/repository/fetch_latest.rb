# frozen_string_literal: true

require "fileutils"
require "rugged"

module HanakaiContributors
  module Operations
    module Git
      module Repository
        class FetchLatest < HanakaiContributors::Operation
          def call(github_repository:)
            repo_path = repository_location.join(github_repository)

            if File.exist?(repo_path)
              repo = Rugged::Repository.new(repo_path.to_s)
              repo.fetch("origin")
              repo.reset("origin/main", :hard)
              repo
            else
              Rugged::Repository.clone_at("https://github.com/#{github_repository}", repo_path.to_s)
            end
          end

          private

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
