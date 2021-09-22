class PlantPlotsController < ApplicationController
  def destroy
    pp = PlantPlot.find_by_ids(params[:plant_id], params[:plot_id])
    PlantPlot.destroy(pp.ids)
    redirect_to '/plots'
  end
end
