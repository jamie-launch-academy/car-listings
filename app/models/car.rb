class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer,
    presence: true

  validates :color,
  presence: true,
  format: { with: /\A[a-zA-Z]+\z/ }

  validates :year,
  presence: true

  validates :mileage,
  presence: true,
  numericality: { only_integer: true,
  message: "must be numerical" }
end
