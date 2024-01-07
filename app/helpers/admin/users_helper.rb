module Admin::UsersHelper
  def user_status_options
    User.statuses.map { |key, _value| [t("enums.user.status.#{key}"), key] }
  end
end
