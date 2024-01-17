# frozen_string_literal: true

class Artwork::CardFrameComponent < ViewComponent::Base
  attr_reader :id

  def initialize(id: nil)
    @id = id
  end

  def base_class
    "w-full grid justify-items-center gap-x-2 gap-y-14 grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4"
  end
end
