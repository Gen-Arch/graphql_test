$: << File.expand_path('../../', __dir__)
require 'models/test.rb'

module Mutations
  class CreateTest < GraphQL::Schema::Mutation
    description 'Creates a Test'

    argument :name, String, required: true
    argument :text, String, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(name: ,text:)
      test = Test.new(
        name: name,
        text: text,
      )

      if test.save
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: test.errors.full_messages
        }
      end
    end
  end
end
