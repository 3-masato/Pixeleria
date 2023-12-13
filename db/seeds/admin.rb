module Seeds
  class Admins
    def self.create(email, password)
      Admin.create!(
        email: email,
        password: password,
      )
      puts "[Seeds] 管理者を作成しました。"
    end
  end
end
