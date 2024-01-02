class Report < ApplicationRecord
  MAX_DESCRIPTION_LENGTH = 200

  belongs_to :reportable, polymorphic: true
  belongs_to :reported_by_user, class_name: "User"

  enum reason: {
    malicious_expression: 0,
    inappropriate_content: 1,
    misinformation: 2,
    commercial_purposes: 3,
    spam: 4,
    other: 5
  }
  enum status: { pending: 0, processing: 1, resolved: 2 }

  validates :description, length: { maximum: MAX_DESCRIPTION_LENGTH }

  # Reportレコードを取得する際、デフォルトで新しい作品が先頭に来るようにする。
  default_scope { order(created_at: :desc) }
  scope :with_details, -> { includes(:reported_by_user, :reportable) }

  def self.max_description_length
    MAX_DESCRIPTION_LENGTH
  end
end
