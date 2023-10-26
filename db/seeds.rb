# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

user_1 = User.create!(
  first_name: "Jon",
  last_name: "Doe",
  street: "Main Street",
  house_number: 10,
  city: "Olympia",
  postcode: "XYZ 123",
  country: "USA"
)

user_2 = User.create!(
  first_name: "Stephen",
  last_name: "Fry",
  street: "Brighton Road",
  house_number: 44,
  city: "London",
  postcode: "123 ABC",
  country: "UK"
)

post_1 = Post.create!(
  user_id: user_1.id,
  body: "A post by #{user_1.first_name}"
)

post_2= Post.create!(
  user_id: user_2.id,
  body: "A post by #{user_2.first_name}"
)

Comment.create!(
  post_id: post_1.id,
  body: "Hello, here's a comment!"
)

Comment.create!(
  post_id: post_2.id,
  body: "Hello, here's another comment!"
)
