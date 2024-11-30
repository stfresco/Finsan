class Account < ApplicationRecord
  belongs_to :user
  has_one :balance
  has_one :balance, dependent: :destroy
  has_many :my_transactions
  validates :bank, :account_type, :currency, presence: true
  after_create :create_balance

  def create_balance
    Balance.create!(account: self, total_amount: 0, status: true)
  end

end
