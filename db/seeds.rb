# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if User.none?
  User.__elasticsearch__.create_index!(force: true)
  puts "Creating Users"
  User.create(
      first_name: "Kevin",
      middle_name: "Cuong",
      last_name: "Ngo",
      phone_number: "4082282294",
      password: "development",
      password_confirmation: "development",
      email: "xngokevin@yahoo.com"
  )


  User.create(
      first_name: "Kevin2",
      middle_name: "Cuong",
      last_name: "Ngo",
      phone_number: "4082282294",
      password: "development",
      password_confirmation: "development",
      email: "xngokevin@gmail.com"
  )
end