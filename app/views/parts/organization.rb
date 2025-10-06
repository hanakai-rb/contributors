module HanakaiContributors
  module Views
    module Parts
      class Organization < HanakaiContributors::Views::Part
        def avatar_url
          "https://avatars.githubusercontent.com/#{github_organization}"
        end

        def github_url
          "https://github.com/#{github_organization}"
        end
      end
    end
  end
end
