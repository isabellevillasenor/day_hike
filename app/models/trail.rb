class Trail < ApplicationRecord
  has_many :trip_trails, dependent: :destroy
  has_many :trips, through: :trip_trails
  validates_presence_of :name, :address, :length
  validates_numericality_of :length, only_integer: true, greater_than: 0

  def all_trips
    trips.all
  end

  def total_trips
    trips.count
  end
end
