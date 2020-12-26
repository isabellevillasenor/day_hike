class Trip < ApplicationRecord
  has_many :trip_trails, dependent: :destroy
  has_many :trails, through: :trip_trails
  validates_presence_of :name, :start_date, :end_date

  def all_trails
    trails.all
  end

  def total_distance
    trails.sum(:length)
  end

  def average_distance
    trails.average(:length)
  end

  def longest_trail
    trails.order(length: :desc).first
  end

  def shortest_trail
    trails.order(length: :asc).first
  end
end
