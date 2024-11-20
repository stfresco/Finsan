class MyTransaction < ApplicationRecord
  belongs_to :account
  has_one_attached :image

  validates :amount, presence: true
  validates :date, presence: true
  validates :method, presence: true

  def check_balance
    if 
  end
end
