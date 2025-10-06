# frozen_string_literal: true

ROM::SQL.migration do
  # Add your migration here.
  #
  # See https://guides.hanamirb.org/v2.2/database/migrations/ for details.
  change do
    create_table :contributors do
      primary_key :id

      # Person details
      column :full_name, String, null: false
      column :email, String, null: true # may not have one
      column :github_username, String, null: true # may not have one

      # Tracking how long they've been contributing
      column :first_contribution_at, DateTime, null: false

      # Stats
      column :commits_count, Integer, null: false, default: 0

      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
