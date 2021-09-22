class Garden < ApplicationRecord
  has_many :plots
  ## previous solution for referece
  #has_many :plants, through: :plots

  def harvestable_in_hundred
    plots.joins(:plants)
       .select('plants.*')
       .where('plants.days_to_harvest < ?', 100)
       .distinct

  ## Previous solution for reference
    # plants.where('days_to_harvest < ?', 100)
    #       .distinct
  end
end
