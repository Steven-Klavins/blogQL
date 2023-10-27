class Types::CommentType < Types::BaseObject

  description "A single post comment."

  field :id, ID, null: false
  field :body, String, null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :errors, [Types::ErrorType], null: true

  def errors
    object.errors.map { |e| { field_name: e.attribute, error: object.errors[e.attribute] } }
  end
end

class Types::CommentInputType < GraphQL::Schema::InputObject
  graphql_name "CommentInputType"
  description "The attributes required to create/update a comment."

  argument :id, ID, required: false
  argument :post_id, Integer, required: false
  argument :body, String, required: true
end