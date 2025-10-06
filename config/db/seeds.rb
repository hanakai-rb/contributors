# This seeds file should create the database records required to run the app.
#
# The code should be idempotent so that it can be executed at any time.
#
# To load the seeds, run `hanami db seed`. Seeds are also loaded as part of `hanami db prepare`.

# For example, if you have appropriate repos available:
#
#   category_repo = Hanami.app["repos.category_repo"]
#   category_repo.create(title: "General")
#
# Alternatively, you can use relations directly:
#
#   categories = Hanami.app["relations.categories"]
#   categories.insert(title: "General")

organizations = Hanami.app["repos.organization_repo"]

tracked_organizations = [
  {
    name: "Hanakai",
    slug: "hanakai",
    github_organization: "hanakai-rb",
    description: "Hanakai is a collection of systems including Hanami, Rom, and Dry"
  },
  {
    name: "Hanami",
    slug: "hanami",
    github_organization: "hanami",
    description: "A flexible framework for maintainable Ruby apps"
  },
  {
    name: "Dry",
    slug: "dry",
    github_organization: "dry-rb",
    description: "A collection of next-generation Ruby libraries, each intended to solve a common task"
  },
  {
    name: "Rom",
    slug: "rom",
    github_organization: "rom-rb",
    description: "Persistence and mapping toolkit for Ruby"
  }
]

tracked_organizations.each do |org|
  existing = organizations.find_by_slug(org[:slug])

  if existing
    organizations.update(existing.id, {
      name: org[:name],
      github_organization: org[:github_organization],
      description: org[:description],
      updated_at: Time.now
    })
  else
    organizations.create(
      name: org[:name],
      slug: org[:slug],
      github_organization: org[:github_organization],
      description: org[:description],
      created_at: Time.now,
      updated_at: Time.now
    )
  end
end

tracked_projects = [
  {
    organization_slug: "hanakai",
    name: "Hanakai Contributors",
    full_name: "hanakai-rb/contributors",
    github_repository: "hanakai-rb/contributors",
    description: "Recognizing the work of all our contributors!",
    slug: "contributors",
  },
  {
    organization_slug: "hanakai",
    name: "Hanakai Website",
    full_name: "hanakai-rb/site",
    github_repository: "hanakai-rb/site",
    description: "The official website for the Hanakai ecosystem",
    slug: "site",
  },
  {
    organization_slug: "hanami",
    name: "Hanami",
    full_name: "hanami/hanami",
    github_repository: "hanami/hanami",
    description: "A flexible framework for maintainable Ruby apps",
    slug: "hanami",
  },
  {
    organization_slug: "hanami",
    name: "Hanami CLI",
    full_name: "hanami/cli",
    github_repository: "hanami/cli",
    description: "Command Line Interface for Hanami framework",
    slug: "cli",
  },
  {
    organization_slug: "hanami",
    name: "Hanami Utils",
    full_name: "hanami/utils",
    github_repository: "hanami/utils",
    description: "Utility functions for Hanami framework",
    slug: "utils",
  },
  {
    organization_slug: "hanami",
    name: "Hanami Router",
    full_name: "hanami/router",
    github_repository: "hanami/router",
    description: "The Hanami router",
    slug: "router",
  },
  {
    organization_slug: "hanami",
    name: "Hanami Assets",
    full_name: "hanami/assets",
    github_repository: "hanami/assets",
    description: "Asset management for Ruby web applications",
    slug: "assets",
  },
  {
    organization_slug: "hanami",
    name: "Hanami Webconsole",
    full_name: "hanami/webconsole",
    github_repository: "hanami/webconsole",
    description: "Web console for Hanami applications",
    slug: "webconsole",
  },
    {
    organization_slug: "hanami",
    name: "Hanami Rspec",
    full_name: "hanami/rspec",
    github_repository: "hanami/rspec",
    description: "Hanami RSpec extensions",
    slug: "rspec",
  },
  {
    organization_slug: "hanami",
    name: "Hanami Reloader",
    full_name: "hanami/reloader",
    github_repository: "hanami/reloader",
    description: "Code reloading for Hanami 2",
    slug: "reloader",
  },
  {
    organization_slug: "hanami",
    name: "Hanami DB",
    full_name: "hanami/db",
    github_repository: "hanami/db",
    description: "The database layer for Hanami",
    slug: "db",
  },
  {
    organization_slug: "hanami",
    name: "Hanami View",
    full_name: "hanami/view",
    github_repository: "hanami/view",
    description: "Views, templates and presenters for Ruby web applications",
    slug: "view",
  },
]

projects = Hanami.app["repos.project_repo"]
tracked_projects.each do |proj|
  organization = organizations.find_by_slug(proj[:organization_slug])
  next unless organization

  existing = projects.find_by_organization(organization).find { |p| p.slug == proj[:slug] }

  if existing
    projects.update(existing.id, {
      name: proj[:name],
      full_name: proj[:full_name],
      description: proj[:description],
      github_repository: proj[:full_name],
      updated_at: Time.now
    })
  else
    projects.create(
      organization_id: organization.id,
      name: proj[:name],
      full_name: proj[:full_name],
      description: proj[:description],
      slug: proj[:slug],
      github_repository: proj[:full_name],
      created_at: Time.now,
      updated_at: Time.now
    )
  end
end

contributors = Hanami.app["repos.contributor_repo"]

# Add any known contributors here to ensure they are in the system
known_contributors = [
  {
    full_name: "Andrea Fomera",
    email: "afomera@hey.com",
    github_username: "afomera",
    first_contribution_at: Time.new(2015, 1, 1),
  }
]

known_contributors.each do |contrib|
  existing = contributors.find_by_github_username(contrib[:github_username]) if contrib[:github_username]
  existing ||= contributors.find_by_email(contrib[:email]) if contrib[:email]

  if existing
    contributors.update(existing.id, {
      full_name: contrib[:full_name],
      email: contrib[:email],
      github_username: contrib[:github_username],
      updated_at: Time.now
    })
  else
    contributors.create(
      full_name: contrib[:full_name],
      email: contrib[:email],
      github_username: contrib[:github_username],
      first_contribution_at: contrib[:first_contribution_at],
      created_at: Time.now,
      updated_at: Time.now
    )
  end
end
