class Types::PostType < Types::BaseObject

  description "A single user post."

  field :id, ID, null: false
  field :author, String, null: false
  field :body, String, null: false
  field :comments, [Types::CommentType], null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :errors, [Types::ErrorType], null: true

  def author
    user = User.where(object.user_id)
    "#{user.first_name} #{user.last_name}"
  end

  def comments
    object.comments
  end

  def errors
    object.errors.map {|e| {field_name: e.attribute, error: object.errors[e.attribute]}}
  end
end

class Types::PostInputType < GraphQL::Schema::InputObject
  graphql_name "PostInputType"
  description "The attributes required to create/update an post."

  argument :id, ID, required: false
  argument :user_id, Integer, required: true
  argument :body, String, required: true
end