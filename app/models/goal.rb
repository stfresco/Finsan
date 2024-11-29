class Goal < ApplicationRecord
  belongs_to :user
  has_many :milestones, dependent: :destroy
  has_many :my_transactions

  validates :title, presence: true
  validates :status, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true
end
