class MyTransaction < ApplicationRecord
  belongs_to :account
  has_one_attached :image
  belongs_to :goal, optional: true

  validates :amount, :mytransaction_type, :category, presence: true
  validates :date, presence: true
  validates :method, presence: true

  attr_accessor :custom_category

  after_create :update_balance_after_create
  before_update :store_previous_amount
  after_update :update_balance_after_update
  before_destroy :update_balance_before_destroy


  private

  def update_balance_after_create
    balance = account.balance
    if mytransaction_type == "Ingreso"
      balance.update(total_amount: balance.total_amount + amount)
    else
      balance.update(total_amount: balance.total_amount - amount)
    end
  end

  def store_previous_amount
    @previous_amount = amount_was
    @previous_type = mytransaction_type_was
  end

  def update_balance_after_update
    balance = account.balance
    current_total = balance.total_amount

    if @previous_type == "Ingreso"
      current_total -= @previous_amount
    else
      current_total += @previous_amount
    end

    if mytransaction_type == "Ingreso"
      current_total += amount
    else
      current_total -= amount
    end

    balance.update(total_amount: current_total)
  end

  def update_balance_before_destroy
    balance = account.balance
    if mytransaction_type == "Ingreso"
      balance.update(total_amount: balance.total_amount - amount)
    else
      balance.update(total_amount: balance.total_amount + amount)
    end
  end
end
