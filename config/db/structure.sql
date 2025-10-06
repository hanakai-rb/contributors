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
CREATE TABLE `contributors`(
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NULL,
  `github_username` varchar(255) NULL,
  `first_contribution_at` timestamp NOT NULL,
  `commits_count` integer DEFAULT(0) NOT NULL,
  `created_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL,
  `updated_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL
);
CREATE TABLE `commits`(
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `organization_id` integer NOT NULL REFERENCES `organizations` ON DELETE CASCADE,
  `project_id` integer NOT NULL REFERENCES `projects` ON DELETE CASCADE,
  `contributor_id` integer NULL REFERENCES `contributors`,
  `sha1` varchar(255) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `author_email` varchar(255) NOT NULL,
  `committer_name` varchar(255) NOT NULL,
  `committer_email` varchar(255) NOT NULL,
  `committed_at` timestamp NOT NULL,
  `message` text NULL,
  `diff` text NULL,
  `merge` boolean DEFAULT(0) NOT NULL,
  `created_at` timestamp DEFAULT(datetime(CURRENT_TIMESTAMP, 'localtime')) NOT NULL
);
INSERT INTO schema_migrations (filename) VALUES
('20251005174638_create_organizations.rb'),
('20251005184524_create_projects.rb'),
('20251005215005_create_contributors.rb'),
('20251005220032_create_commits.rb');
