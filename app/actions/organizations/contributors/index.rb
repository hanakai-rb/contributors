# frozen_string_literal: true

module HanakaiContributors
  module Actions
    module Organizations
      module Contributors
        class Index < HanakaiContributors::Action
          include Deps["repos.organization_repo", "repos.project_repo"]

          def handle(request, response)
            selected_organization = organization_repo.find_by_slug(request.params[:org]) if request.params[:org]

            if selected_organization
              response[:selected_organization] = selected_organization
              response[:contributors] = ["some", "two"]
            else
              response[:contributors] = ["all"]
            end
          end
        end
      end
    end
  end
end
