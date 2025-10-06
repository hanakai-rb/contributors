# frozen_string_literal: true

ROM::SQL.migration do
  # Add your migration here.
  #
  # See https://guides.hanamirb.org/v2.2/database/migrations/ for details.
  change do
    create_table :projects do
      primary_key :id
      foreign_key :organization_id, :organizations, on_delete: :cascade, null: false


      column :name, String, null: false # e.g., hanami, cli, dry-types
      column :full_name, String, null: false # e.g., hanami/hanami, hanami/cli
      column :description, String, null: false

      column :slug, String, null: false
      column :default_branch, String, null: false, default: "main"

      column :github_repository, String, null: false # e.g. hanami/hanami

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
