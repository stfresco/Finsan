class Account < ApplicationRecord
  belongs_to :user
  has_many :goals
  has_one :balance
end
