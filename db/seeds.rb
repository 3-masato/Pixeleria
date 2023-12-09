# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require_relative "seeds/user"

DEV_USER_EMAIL = "dev@example.com"
DEV_USER_PASSWORD = "password"

users = Seeds::Users.create_dev_user(
  DEV_USER_EMAIL,
  DEV_USER_PASSWORD
)
users = Seeds::Users.create(3)

require_relative "seeds/artwork"
users.each do |user|
  Seeds::Artworks.create_artwork_canvases(user, 3)
end
