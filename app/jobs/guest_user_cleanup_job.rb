class GuestUserCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # 1日以上前に作成されたゲストユーザーを削除する
    User.where(is_guest: true).where('created_at < ?', 1.days.ago).destroy_all
  end
end
