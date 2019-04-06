require_relative 'types/test'
require 'models/test'

class QueryType < GraphQL::Schema::Object
  description 'The query root of this schema'

  field :all, [Types::Test], null: true do
    description 'Response All Data'
  end

  def all
    Test.all
  end
end
