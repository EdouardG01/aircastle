class Castle < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :user, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true
end
