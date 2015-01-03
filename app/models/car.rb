class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer,
    presence: true

  validates :color,
  presence: true

  validates :year,
  presence: true

  validates :mileage,
  presence: true
end
