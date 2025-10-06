# frozen_string_literal: true

module HanakaiContributors
  module Views
    module Organizations
      module Contributors
        class Index < HanakaiContributors::View
          include Deps["repos.organization_repo"]

          expose :organizations do
            organization_repo.all
          end

          expose :selected_organization

          # Exposes the list of contributors, either filtered by organization or all projects
          # depending on whether an organization is selected.
          expose :contributors
        end
      end
    end
  end
end
