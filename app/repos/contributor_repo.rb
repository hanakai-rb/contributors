# frozen_string_literal: true

module HanakaiContributors
  module Repos
    class ContributorRepo < HanakaiContributors::DB::Repo
      include Deps["repos.commit_repo"]

      def all
        contributors.to_a
      end

      def all_by_commits_count
        contributors.order(Sequel.desc(:commits_count)).to_a
      end

      def delete_all_yes_really!
        contributors.command(:delete).call
      end

      def by_organization(organization_id)
        # TODO: Join in projects for a given organization and aggregate commit contributors
        []
      end

      def by_name(name)
        contributors.where(full_name: name).to_a
      end

      def create(attributes)
        contributors.command(:create).call(attributes)
      end

      def update(id, attributes)
        contributors.where(id: id).command(:update).call(attributes)
      end

      def find_or_create_by_email(email, name = nil)
        # Map known variations of a user email to a single canonical email
        # For example, if a user has commits with both their personal and work email addresses
        # you might want to map one to the other here.
        # This is a placeholder for such logic.
        email = map_known_human_emails(email)

        contributor = find_by_email(email)
        return contributor if contributor

        contributor = create(email: email, full_name: name, first_contribution_at: Time.now)
        contributor
      end

      def update_total_contributions(contributor_id)
        total_contributions = commit_repo.by_contributor(contributor_id).count
        update(contributor_id, commits_count: total_contributions)
      end

      ## Finders

      def find(id)
        contributors.where(id: id).one
      end

      def find_by_email(email)
        contributors.where(email: email).one
      end

      def find_by_github_username(username)
        contributors.where(github_username: username).one
      end

      def with_duplicates_by_name
        contributors.select_group(:full_name).having { count(id) > 1 }.to_a
          .map { |c| c[:full_name] }
          .map { |name| contributors.where(full_name: name).to_a }
          .flatten
          .sort_by { |c| c.full_name.downcase }
      end

      private

      def map_known_human_emails(email)
        # Implement any email mapping logic here
        # TODO: Make this better
        {
          "afomera@hey.com" => "andrea.fomera@gmail.com",
          "tim@icelab.com.au" => "tim@riley.id.au",
          "tim.riley@example" => "tim@riley.id.au",
          "tim@openmonkey.com" => "tim@riley.id.au",
          "cllns@users.noreply.github.com" => "sean@cllns.com",
          "solnic@users.noreply.github.com" => "peter@solnica.online", # IDK if these are right
          "piotr.solnica@gmail.com" => "peter@solnica.online", # IDK if these are right
          "piotr.solnica+oss@gmail.com" => "peter@solnica.online", # IDK if these are right

          "don.mist@gmail.com" => "antondavydov.o@gmail.com"
        }[email] || email
      end
    end
  end
end
