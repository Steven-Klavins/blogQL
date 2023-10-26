class Types::CommentType < Types::BaseObject

  description "A single post comment."

  field :id, ID, null: false
  field :body, String, null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
end