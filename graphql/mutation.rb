require_relative 'mutation/create_test'

class MutationType < GraphQL::Schema::Object
  field :createTest, mutation: Mutations::CreateTest
end
