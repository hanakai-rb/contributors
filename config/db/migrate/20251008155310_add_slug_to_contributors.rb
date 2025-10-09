# frozen_string_literal: true

ROM::SQL.migration do
  # Add your migration here.
  #
  # See https://guides.hanamirb.org/v2.2/database/migrations/ for details.
  change do
    alter_table :contributors do
      add_column :slug, String, null: true
      add_index :slug, unique: true
    end
  end
end
