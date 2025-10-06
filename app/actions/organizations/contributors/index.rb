# frozen_string_literal: true

module HanakaiContributors
  module Actions
    module Organizations
      module Contributors
        class Index < HanakaiContributors::Action
          include Deps["repos.organization_repo", "repos.contributor_repo"]

          def handle(request, response)
            selected_organization = organization_repo.find_by_slug(request.params[:org]) if request.params[:org]

            if selected_organization
              response[:selected_organization] = selected_organization
              response[:contributors] = contributor_repo.by_organization(selected_organization.id)
            else
              response[:contributors] = contributor_repo.all_by_commits_count
            end
          end
        end
      end
    end
  end
end
