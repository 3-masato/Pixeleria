module Seeds
  class Users
    def self.create_dev_user(email, password)
      User.create!(
        email: email,
        password: password,
        display_name: "このは",
        account_name: "conoha_1212",
        introduction: "",
      )
    end

    def self.create(count)
      count.times.map do |i|
        name = "ユーザー#{i + 1}"

        user = User.create!(
          email: "#{SecureRandom.hex(10)}@fake",
          password: SecureRandom.urlsafe_base64,
          display_name: name,
          account_name: SecureRandom.alphanumeric(12),
          introduction: "#{name}の自己紹介文。",
        )

        p "#{name} を作成しました。"

        user
      end
    end
  end
end
