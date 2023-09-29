# frozen_string_literal: true

class Repository < ApplicationRecord
  include AASM

  validates :link, presence: true, uniqueness: true

  # BEGIN
  aasm do
    state :created, initialize: true
    state :fetching
    state :fetched
    state :failed

    event :update_repos do
      transitions from: :created,  to: :fetching
      transitions from: :fetching, to: :fetched
      transitions from: :fetched,  to: :failed
      transitions from: :failed,   to: :created
    end
  end
  # END
end
