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
