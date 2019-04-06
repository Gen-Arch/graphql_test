module Types
  class Test < GraphQL::Schema::Object
    field :name, String, null: false
    field :text, String, null: false
  end
end
