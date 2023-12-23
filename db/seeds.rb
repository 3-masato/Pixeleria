# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者のSeed作成
require_relative "seeds/admin"

DEV_ADMIN_EMAIL = "admin@admin"
DEV_ADMIN_PASSWORD = "adminadmin"

Seeds::Admins.create(
  DEV_ADMIN_EMAIL,
  DEV_ADMIN_PASSWORD,
)

# ユーザーのSeed作成
require_relative "seeds/user"

DEV_USER_EMAIL = "dev@example.com"
DEV_USER_PASSWORD = "password"

dev_user = Seeds::Users.create_dev_user(
  DEV_USER_EMAIL,
  DEV_USER_PASSWORD
)
users = Seeds::Users.create(30)

# ドット絵のSeed作成
require_relative "seeds/artwork"
users.slice(0, 5).each do |user|
  Seeds::Artworks.create_artwork_canvases(user, 50)
end

users.each do |user|
  dev_user.follow(user)
  user.follow(dev_user)
  p "#{dev_user.display_name}と#{user.display_name}を相互フォローにしました。"
end
