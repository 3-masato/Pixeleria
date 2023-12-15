module ApplicationHelper
  ##
  # ヘッダーナビの各項目を返します。
  # 顧客もしくは管理者のログイン状態によって項目が変わります。
  #
  # @return [Array<Hash>] ヘッダーナビ項目の配列
  #   @option (Hash) :path [String] リンク先のURL。
  #   @option (Hash) :text [String] リンクの表示テキスト。
  #   @option (Hash) :method (optional) [Symbol] HTTPメソッド（例：:delete）。指定無しの場合は空にします。
  def nav_items
    if admin_signed_in?
      admin_nav_items
    elsif user_signed_in?
      user_nav_items
    else
      visitor_nav_items
    end
  end

  private
  def admin_nav_items
    [
      {
        path: admin_root_path,
        text: "Home",
      },
      {
        path: destroy_admin_session_path,
        text: t("devise.shared.sign_out"),
        method: :delete
      }
    ]
  end

  def user_nav_items
    [
      {
        path: user_profile_path(current_user.account_name),
        text: "mypage"
      },
      {
        path: destroy_user_session_path,
        text: t("devise.shared.sign_out"),
        method: :delete
      }
    ]
  end

  def visitor_nav_items
    [
      {
        path: new_user_session_path,
        text: t("devise.shared.sign_in")
      },
      {
        path: new_user_registration_path,
        text: t("devise.shared.sign_up")
      }
    ]
  end
end
