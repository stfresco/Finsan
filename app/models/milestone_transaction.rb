class MilestoneTransaction < ApplicationRecord
  belongs_to :milestone
  belongs_to :transactions

end
