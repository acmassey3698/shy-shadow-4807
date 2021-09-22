class PlantPlotsController < ApplicationController
  def destroy
    PlantPlot.destroy(params[:id])
    redirect_to '/plots'
  end
end
