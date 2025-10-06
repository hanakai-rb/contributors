# frozen_string_literal: true

module HanakaiContributors
  module Repos
    class CommitRepo < HanakaiContributors::DB::Repo
      def all
        commits.to_a
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
    end
  end
end
