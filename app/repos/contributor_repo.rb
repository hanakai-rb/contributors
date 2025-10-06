# frozen_string_literal: true

module HanakaiContributors
  module Repos
    class ContributorRepo < HanakaiContributors::DB::Repo
      def all
        contributors.to_a
      end

      def by_organization(organization_id)
        # TODO: Join in projects for a given organization and aggregate commit contributors
        []
      end

      def create(attributes)
        contributors.command(:create).call(attributes)
      end

      def update(id, attributes)
        contributors.where(id: id).command(:update).call(attributes)
      end

      ## Finders

      def find(id)
        contributors.where(id: id).one
      end

      def find_by_email(email)
        contributors.where(email: email).one
      end

      def find_by_github_username(username)
        contributors.where(github_username: username).one
      end
    end
  end
end
