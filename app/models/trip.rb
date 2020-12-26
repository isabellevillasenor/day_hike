class Trip < ApplicationRecord
  has_many :trip_trails, dependent: :destroy
  has_many :trails, through: :trip_trails
  validates_presence_of :name, :start_date, :end_date

  def all_trails
    trails.all
  end
end
