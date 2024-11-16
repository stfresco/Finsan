class MilestoneTransaction < ApplicationRecord
  belongs_to :milestone
  belongs_to :my_transaction

end
