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

  ##
  # サイドバーの各項目の配列を返します。
  # 現在のところは、管理者がサインインしている場合にのみサイドバー項目を生成します。
  #
  # @return [Array<Hash>] サイドバー項目の配列
  #   @option (Hash) :path [String] サイドバー項目のURLパス。
  #   @option (Hash) :text [String] サイドバー項目の表示テキスト。
  #   @option (Hash) :fa_class [String] 項目のアイコンに使用するFont Awesomeのクラス。
  def sidebar_items
    if admin_signed_in?
      admin_sidebar_items
    end
  end

  private
  # ================
  # nav items
  # ================

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

  # ================
  # sidebar items
  # ================

  def admin_sidebar_items
    [
      {
        path: admin_users_path,
        text: t("model.user"),
        fa_class: "fa-solid fa-users"
      },
      {
        path: admin_artworks_path,
        text: t("model.artwork"),
        fa_class: "fa-solid fa-palette"
      },
      {
        path: admin_comments_path,
        text: t("model.comment"),
        fa_class: "fa-solid fa-comments"
      },
      {
        path: admin_reports_path,
        text: t("model.report"),
        fa_class: "fa-solid fa-flag"
      }
    ]
  end
end
