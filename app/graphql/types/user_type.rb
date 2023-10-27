class Types::UserType < Types::BaseObject

  description "A single user."

  field :id, ID, null: false
  field :first_name, String, null: false
  field :last_name, String, null: false
  field :street, String, null: true
  field :house_number, Integer, null: true
  field :city, String, null: true
  field :country, String, null: false
  field :full_address, String, null: false
  field :posts, [Types::PostType], null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false

  def posts
    object.posts
  end

  def full_address
    "#{object.house_number} #{object.street} #{object.city} #{object.country}"
  end
end

class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name "UserInputType"
  description "The attributes required to create/update a user."

  argument :id, ID, required: false
  argument :first_name, String, required: false
  argument :last_name, String, required: true
  argument :street, String, required: false
  argument :house_number, Integer, required: false
  argument :city, String, required: false
  argument :country, String, required: true
end