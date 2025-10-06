# frozen_string_literal: true

module HanakaiContributors
  module Repos
    class CommitRepo < HanakaiContributors::DB::Repo
      def all
        commits.to_a
      end

      # TODO: Remove this
      def delete_all_yes_really!
        commits.command(:delete).call
      end

      def create_from_rugged_commit(rugged_commit, project_id:, organization_id:)
        if rugged_commit.oid
          existing = find_by_sha1(rugged_commit.oid)
          return existing if existing
        end

        commits.command(:create).call(
          sha1: rugged_commit.oid,
          message: rugged_commit.message.force_encoding('UTF-8'),
          author_name: rugged_commit.author[:name].force_encoding('UTF-8'),
          author_email: rugged_commit.author[:email].force_encoding('UTF-8'),
          committer_name: rugged_commit.committer[:name].force_encoding('UTF-8'),
          committer_email: rugged_commit.committer[:email].force_encoding('UTF-8'),
          committed_at: rugged_commit.committer[:time],
          merge:           rugged_commit.parents.size > 1,

          # Details we don't get from Rugged::Commit directly but need to store
          project_id: project_id,
          organization_id: organization_id
        )
      end

      def update(sha1, attributes)
        commits.where(sha1: sha1).command(:update).call(attributes)
      end

      def by_project(project_id)
        commits.where(project_id: project_id).to_a
      end

      def by_contributor(contributor_id)
        commits.where(contributor_id: contributor_id).to_a
      end

      def by_organization(organization_id)
        commits.where(organization_id: organization_id).to_a
      end

      ## Finders

      def find_by_sha1(sha1)
        commits.where(sha1: sha1).one
      end
    end
  end
end
