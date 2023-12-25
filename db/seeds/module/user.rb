require_relative "../util/chalk"
module Seeds
  class Users
    DEV_USER_EMAIL = "dev@example.com"
    DEV_USER_PASSWORD = "password"

    def self.create_dev_user(email = DEV_USER_EMAIL, password = DEV_USER_PASSWORD)
      user = User.find_or_create_by!(email: email) do |user|
        user.password = password
        user.display_name = "このは"
        user.account_name = "conoha_1212"
        user.introduction = "デジタルアートをこよなく愛し、夢のような世界を描くのが得意です🎨✨"
      end
      Chalk.info("Created User for development environment.")
      user
    end

    def self.create(count)
      users = count.times.map do |i|
        email = "#{SecureRandom.hex(10)}@fake"
        name = "ユーザー#{i + 1}"
        user = User.find_or_create_by!(email: email) do |user|

          user.password = SecureRandom.urlsafe_base64
          user.display_name = name
          user.account_name = SecureRandom.alphanumeric(12)
          user.introduction = "#{name}の自己紹介文。"

        end
        Chalk.info("Created User #{name}.")
        user
      end
      Chalk.info("Created #{count} Users.")
      users
    end
  end
end
