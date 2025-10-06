# frozen_string_literal: true

module HanakaiContributors
  module Views
    module Organizations
      class Show < HanakaiContributors::View
        include Deps["repos.project_repo"]

        expose :organization do |organization: nil|
          organization
        end

        expose :projects do |organization: nil|
          project_repo.find_by_organization(organization.id)
        end
      end
    end
  end
end
