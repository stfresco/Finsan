class Milestone < ApplicationRecord
  belongs_to :goal

  validates :amount, presence: true
end
