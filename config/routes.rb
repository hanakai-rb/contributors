# frozen_string_literal: true

module HanakaiContributors
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.
    root to: "home.index"
    get "/contributors", to: "home.index"
    get "/:org/contributors", to: "home.index"
  end
end
