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
  }
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
