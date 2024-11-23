class MyTransaction < ApplicationRecord
  belongs_to :account
  has_one_attached :image

  validates :amount, presence: true
  validates :date, presence: true
  validates :method, presence: true

  after_create :check_balance

  def check_balance
    balance = account.balance
    if mytransaction_type == "ingreso"
      if balance.total_amount >= self.amount
        balance.update(total_amount: balance.total_amount + amount)
      end
    else
      if balance.total_amount >= self.amount
        balance.update(total_amount: balance.total_amount - amount)
      end
    end
  end
end
