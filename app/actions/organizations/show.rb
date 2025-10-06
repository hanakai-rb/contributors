# frozen_string_literal: true

module HanakaiContributors
  module Actions
    module Organizations
      class Show < HanakaiContributors::Action
        include Deps["repos.organization_repo"]

        def handle(request, response)
          organization = organization_repo.find_by_slug!(request.params[:org])

          response.render(
            view,
            org: request.params[:org],
            organization: organization
          )
        end
      end
    end
  end
end
