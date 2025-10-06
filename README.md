# Hanakai Contributors

Hanakai Contributors is a Hanami application to showcase the contributions to the Hanakai ecoystem.

## Getting Started

- Run the server with `bin/dev`
- View the app at [http://localhost:2300](http://localhost:2300)
- Run the tests with `bundle exec rake`

# Dev notes

Any time we update `map_known_human_emails` in contributor_repo for the moment we need to reset all commits.

```rb
# get latest code loaded
reload

# Delete all commits
app["repos.commit_repo"].delete_all_yes_really!

# Delete all contributors
 app["repos.contributor_repo"].delete_all_yes_really!

 # Clean import of all commits for known repos in db/seeds file
repos = app["repos.project_repo"].all.map(&:github_repository)
repos.each { |r| app["operations.git.repository.attribute_commits"].call(github_repository: r) }
```

## Useful Links

- [Hanami Home](http://hanamirb.org)
- [Hanami Guides](https://guides.hanamirb.org/)
- [Hanami API Doc](https://gemdocs.org/gems/hanami/latest)
