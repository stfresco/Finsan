class Balance < ApplicationRecord
  belongs_to :account

  validates :bank, presence: true
  validates :account_type, presence: true
end
