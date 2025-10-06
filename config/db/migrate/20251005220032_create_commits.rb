# frozen_string_literal: true

ROM::SQL.migration do
  # Add your migration here.
  #
  # See https://guides.hanamirb.org/v2.2/database/migrations/ for details.
  change do
    create_table :commits do
      primary_key :id
      foreign_key :organization_id, :organizations, null: false, on_delete: :cascade
      foreign_key :project_id, :projects, null: false, on_delete: :cascade

      foreign_key :contributor_id, :contributors, null: true # may not be associated yet

      column :sha1, String, null: false
      column :author_name, String, null: false
      column :author_email, String, null: false
      column :committer_name, String, null: false
      column :committer_email, String, null: false

      column :committed_at, DateTime, null: false

      text :message, null: true
      text :diff, null: true

      boolean :merge, null: false, default: false

      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
