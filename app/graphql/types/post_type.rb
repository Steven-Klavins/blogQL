class Types::PostType < Types::BaseObject

  description "A single user post."

  field :id, ID, null: false
  field :author, String, null: false
  field :body, String, null: false
  field :comments, [Types::CommentType], null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false

  def author
    user = User.where(object.user_id)
    "#{user.first_name} #{user.last_name}"
  end

  def comments
    object.comments
  end
end