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