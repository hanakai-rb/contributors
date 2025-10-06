# frozen_string_literal: true

module HanakaiContributors
  module Views
    module Home
      class Index < HanakaiContributors::View
        include Deps["repos.organization_repo"]

        expose :organizations do
          organization_repo.all
        end

        # Exposes the list of projects, either filtered by organization or all projects
        # depending on whether an organization is selected.
        expose :projects
      end
    end
  end
end
