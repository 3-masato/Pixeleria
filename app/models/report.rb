class Report < ApplicationRecord
  belongs_to :reportable, polymorphic: true
  belongs_to :reported_by_user, class_name: 'User'

  enum reason: {
    malicious_expression: 0,
    inappropriate_content: 1,
    misinformation: 2,
    commercial_purposes: 3,
    spam: 4,
    other: 5
  }
  enum status: { pending: 0, processing: 1, resolved: 2 }
end
