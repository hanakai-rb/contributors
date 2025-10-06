CREATE TABLE `schema_migrations`(`filename` varchar(255) NOT NULL PRIMARY KEY);
CREATE TABLE `organizations`(
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `github_organization` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
);
CREATE TABLE `projects`(
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `organization_id` integer NOT NULL REFERENCES `organizations` ON DELETE CASCADE,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `default_branch` varchar(255) DEFAULT('main') NOT NULL,
  `github_repository` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
);
INSERT INTO schema_migrations (filename) VALUES
('20251005174638_create_organizations.rb'),
('20251005184524_create_projects.rb');
