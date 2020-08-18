class Castle < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :photo

  validates :name, presence: true # , uniqueness: true
  validates :user, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true
end
