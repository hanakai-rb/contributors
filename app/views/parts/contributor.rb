
require "digest/md5"

module HanakaiContributors
  module Views
    module Parts
      class Contributor < HanakaiContributors::Views::Part
        def avatar_url
          "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase)}?d=identicon"
        end

        def formatted_username
          return nil if github_username.nil? || github_username.empty?

          "@#{github_username}"
        end

        def github_url
          "https://github.com/#{github_username}"
        end
      end
    end
  end
end
