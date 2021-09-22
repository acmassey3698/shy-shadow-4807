class Garden < ApplicationRecord
  has_many :plots

  def harvestable_in_hundred
      plots.joins(:plants)
         .select('plants.*')
         .where('plants.days_to_harvest < 100')
         .distinct
  end
end
