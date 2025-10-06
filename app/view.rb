# auto_register: false
# frozen_string_literal: true

require "hanami/view"

module HanakaiContributors
  class View < Hanami::View
    expose :org, layout: true, decorate: false do |context:, org: nil, slug: nil|
      orgs = %w[hanami dry rom]

      detected = nil

      # If org was provided explicitly (e.g. from guides actions), trust it
      if org && orgs.include?(org)
        detected = org
      end

      detected || "hanakai"
    end

    expose :theme, layout: true, decorate: false do |context:, org: nil, slug: nil|
      orgs = %w[hanami dry rom]

      detected = nil

      # If org was provided explicitly (e.g. from guides actions), trust it
      if org && orgs.include?(org)
        detected = org
      end

      path = context.request.path

      # Infer org from /docs/:slug pattern
      if detected.nil?
        slug ||= path[/\A\/docs\/([^\/]+)/, 1]
        if slug
          if orgs.include?(slug)
            detected = slug
          else
            prefix = slug.split(/[-_]/).first
            detected = prefix if orgs.include?(prefix)
          end
        end
      end

      detected || "hanakai"
    end
  end
end
