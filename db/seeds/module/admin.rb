require_relative "../util/chalk"
module Seeds
  class Admins
    DEV_ADMIN_EMAIL = "admin@admin"
    DEV_ADMIN_PASSWORD = "adminadmin"

    def self.create(email = DEV_ADMIN_EMAIL, password = DEV_ADMIN_PASSWORD)
      if Admin.exists?(email: email)
        Chalk.warn("Skipped because Admin already exists.")
        return
      end

      Admin.create!(
        email: email,
        password: password,
      )
      Chalk.info("Created Admin.")
    end
  end
end
