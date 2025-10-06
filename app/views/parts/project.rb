module HanakaiContributors
  module Views
    module Parts
      class Project < HanakaiContributors::Views::Part
        def github_url
          "https://github.com/#{github_repository}"
        end
      end
    end
  end
end
