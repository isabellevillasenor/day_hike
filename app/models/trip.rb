class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails
  validates_presence_of :name, :start_date, :end_date


end
