# frozen_string_literal: true

class Artwork::Search::StatusComponent < ViewComponent::Base
  attr_reader :form

  def initialize(form:)
    @form = form
  end

  def radio_options
    [
      {
        value: :all,
        label_field: :public_status_all,
        label_text: t("artwork.searches.all"),
        checked: true
      }, {
        value: :public,
        label_field: :public_status_public,
        label_text: t("artwork.searches.public"),
        checked: false
      }, {
        value: :private,
        label_field: :public_status_private,
        label_text: t("artwork.searches.private"),
        checked: false
      }
    ]
  end
end
