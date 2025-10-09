# frozen_string_literal: true

module HanakaiContributors
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    root to: "home.index"

    # Contributor specific routes
    # get "/contributors/:username", to: "contributors.show"
    get "/contributors/:slug/commits", to: "contributors.commits.index", as: :contributor_commits
    get "/contributors", to: "organizations.contributors.index", as: :contributors
    get "/commits", to: "commits.index"
    get "/contributors/commits", to: "contributors.commits.index"
  end
end
