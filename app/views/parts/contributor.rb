
module HanakaiContributors
  module Views
    module Parts
      class Contributor < HanakaiContributors::Views::Part
        def avatar_url
          if !github_username.nil? && !github_username.empty?
            "https://avatars.githubusercontent.com/#{github_username}"
          elsif !email.nil? && !email.empty?
            "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase)}?d=identicon"
          else
            "https://avatars.laravel.cloud/#{Digest::MD5.hexdigest(id.downcase)}"
          end
        end

        def formatted_username
          "@#{github_username}"
        end

        def github_url
          "https://github.com/#{github_username}"
        end
      end
    end
  end
end
