module Seeds
  CHARS = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + ['_']

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
        name = "ユーザー#{i}"

        user = User.create!(
          email: "test-user-#{i}@fake",
          password: generate_random_string(24),
          display_name: name,
          account_name: generate_random_string(12),
          introduction: "#{name}の自己紹介文。",
        )

        p "#{name} を作成しました。"

        user
      end
    end

    private
    def self.generate_random_string(length)
      length.times.map { CHARS.sample }.join
    end
  end
end
