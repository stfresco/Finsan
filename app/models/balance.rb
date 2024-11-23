class Balance < ApplicationRecord
  belongs_to :account
  before_save :status_check
  
  def status_check
    if total_amount.positive?
      self.status = true
    else
      self.status = false
    end
  end
end
