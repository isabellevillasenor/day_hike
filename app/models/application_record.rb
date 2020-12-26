class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def total_distance
    trails.sum(:length)
  end
end
