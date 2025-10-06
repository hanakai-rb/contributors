# frozen_string_literal: true

module HanakaiContributors
  module Repos
    class ProjectRepo < HanakaiContributors::DB::Repo
      def all
        projects.to_a
      end

      def create(attributes)
        projects.command(:create).call(attributes)
      end

      def update(id, attributes)
        projects.where(id: id).command(:update).call(attributes)
      end

      ## Finders

      def find_by_organization(organization_or_id)
        if organization_or_id.is_a?(HanakaiContributors::Structs::Organization)
          projects.where(organization_id: organization_or_id.id).to_a
        else
          projects.where(organization_id: organization_or_id).to_a
        end
      end
    end
  end
end
