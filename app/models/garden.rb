class Garden < ApplicationRecord
  has_many :plots
  ## added for my current solution
  has_many :plants, through: :plots

  def harvestable_in_hundred
  ## Another solution. Don't know which is better...
    # plots.joins(:plants)
    #    .select('plants.*')
    #    .where('plants.days_to_harvest < ?', 100)
    #    .distinct

    plants.where('days_to_harvest < ?', 100)
          .distinct
  end
end
