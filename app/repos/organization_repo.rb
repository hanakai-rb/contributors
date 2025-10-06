# frozen_string_literal: true

module HanakaiContributors
  module Repos
    class OrganizationRepo < HanakaiContributors::DB::Repo
      def all
        organizations.to_a
      end

      def create(attributes)
        organizations.command(:create).call(attributes)
      end

      def update(id, attributes)
        organizations.where(id: id).command(:update).call(attributes)
      end

      ## Finders

      def find(id)
        organizations.where(id: id).one
      end

      def find_by_slug(slug)
        organizations.where(slug: slug).one
      end

      def find_by_slug!(slug)
        organizations.where(slug: slug).one!
      end
    end
  end
end
