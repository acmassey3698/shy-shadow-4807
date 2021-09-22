class Plant < ApplicationRecord
  has_many :plant_plots
  has_many :plots, through: :plant_plots

  def find_plant_plot(plot_id)
    plant_plots.where(plant_id: id)
               .where(plot_id: plot_id)
               .first
  end 
end
