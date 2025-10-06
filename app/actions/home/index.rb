# frozen_string_literal: true

module HanakaiContributors
  module Actions
    module Home
      class Index < HanakaiContributors::Action
        include Deps["repos.organization_repo", "repos.project_repo"]

        def handle(request, response)
          selected_organization = organization_repo.find_by_slug(request.params[:org]) if request.params[:org]

          if selected_organization
            response[:projects] = project_repo.find_by_organization(selected_organization)
          else
            response[:projects] = project_repo.all
          end
        end
      end
    end
  end
end
