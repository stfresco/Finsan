class Milestone < ApplicationRecord
  belongs_to :goal
  has_many :milestone_transactions

  validates :amount, presence: true
end
