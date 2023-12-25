module Seeds
  require_relative "util/chalk"

  Chalk.info("Start creating Seed for the production environment...")

  # 管理者のSeed作成
  require_relative "module/admin"
  Admins.create(ENV["SEEDS_ADMIN_EMAIL"], ENV["SEEDS_ADMIN_PASSWORD"])

  # ユーザーのSeed作成
  require_relative "module/user"
  users = Users.create(30)

  # ドット絵のSeed作成
  require_relative "module/artwork"
  users.slice(0, 5).each do |user|
    Artworks.create_artwork_canvases(user, 50)
  end

  Chalk.info("Seed creation is complete!")
end
