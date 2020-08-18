class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :castle

  validates :user, presence: true
  validates :castle, presence: true
  validates :starting_date, presence: true
  validates :ending_date, presence: true
  validates :total_price, presence: true
  validates :status, presence: true, inclusion: { in: %w(accepted declined pending), message: "%{value} is not a valid size" }
end
