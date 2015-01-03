class Manufacturer < ActiveRecord::Base
  has_many :cars

  validates :name,
    presence: true,
    uniqueness: { message: "Manufacturer name has already been used" }

  validates :country,
    presence: true
end
