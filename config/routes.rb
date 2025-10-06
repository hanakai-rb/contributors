# frozen_string_literal: true

module HanakaiContributors
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    root to: "home.index"

    # get "/contributors", to: "home.index"

    # Organization specific routes
    get "/:org", to: "organizations.show", as: :organization
    get "/:org/contributors", to: "organizations.contributors.index", as: :organization_contributors
    get "/:org/projects", to: "organizations.projects.index"

    # Contributor specific routes
    # get "/contributors/:username", to: "contributors.show"
    # get "/contributors/:username/commits", to: "contributors.commits.index"
    get "/contributors", to: "organizations.contributors.index", as: :contributors
  end
end
