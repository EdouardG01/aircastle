class Castle < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true # , uniqueness: true
  validates :user, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true
end
