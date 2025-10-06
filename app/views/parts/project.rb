module HanakaiContributors
  module Views
    module Parts
      class Project < HanakaiContributors::Views::Part
        include Deps["repos.organization_repo"]

        def github_url
          "https://github.com/#{github_repository}"
        end

        # This is probably a bad idea...
        # but I want to be able to access the organization details from the project views
        def organization
          @organization ||= organization_repo.find(organization_id)
        end

        def label_color
          case organization.slug
          when "hanakai"
            "bg-hanakai-100"
          when "hanami"
            "bg-hanami-100"
          when "rom"
            "bg-rom-100"
          when "dry"
            "bg-dry-100"
          else
            "bg-gray-100"
          end
        end
      end
    end
  end
end
