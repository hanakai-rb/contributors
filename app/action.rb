# auto_register: false
# frozen_string_literal: true

require "hanami/action"
require "dry/monads"

module HanakaiContributors
  class Action < Hanami::Action
    # Provide `Success` and `Failure` for pattern matching on operation results
    include Dry::Monads[:result]
    include Deps[not_found_view: "views.errors.not_found"]

    handle_exception ROM::TupleCountMismatchError => :handle_not_found

    private

    def handle_not_found(request, response, exception)
      response.status = 404
      response.format = :html
      response.render(not_found_view)
    end
  end
end
