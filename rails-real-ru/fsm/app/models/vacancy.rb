# frozen_string_literal: true

class Vacancy < ApplicationRecord
  include AASM

  validates :title, presence: true
  validates :description, presence: true

  # BEGIN
  aasm column: :vacancy_state do
    state :on_moderate, initialize: true
    state :published
    state :archived

    event :publish do
      transitions from: %i[ on_moderate archived ], to: :published
    end

    event :archive do
      transitions from: %i[ on_moderate published ], to: :archived
    end
  end
  # END
end
