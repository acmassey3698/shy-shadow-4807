class PlantPlot < ApplicationRecord
  belongs_to :plant
  belongs_to :plot

  def self.find_by_ids(plant_id, plot_id)
    where(plant_id: plant_id)
    .where(plot_id: plot_id)
  end
end
