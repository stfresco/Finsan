class Transaction < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true,
  validates :date, presence: true,
  validates :method, presence: true,
  validates :description
end
