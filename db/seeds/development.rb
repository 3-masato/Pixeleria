module Seeds
  require_relative "util/chalk"

  Chalk.info("Start creating Seed for the development environment...")

  # 管理者のSeed作成
  require_relative "module/admin"
  Admins.create

  # ユーザーのSeed作成
  require_relative "module/user"
  dev_user = Users.create_dev_user
  users = Users.create(30)

  # ドット絵のSeed作成
  require_relative "module/artwork"
  users.slice(0, 3).each do |user|
    Artworks.create_artwork_canvases(user, 100)
  end

  # コメントのSeed作成
  require_relative "module/comment"
  Comments.create

  users.each do |user|
    dev_user.follow(user)
    user.follow(dev_user)
    Chalk.info("#{dev_user.display_name} and #{user.display_name} are now mutual followers.")
  end

  Chalk.info("Seed creation is complete!")
end
