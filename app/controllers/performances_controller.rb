class PerformancesController < ApplicationController
  
  def new
    @show = Show.find(params[:id])
    @performance = Performance.new
  end
  
  def create
    @performance = Performance.new(params[:performance])
    if @performance.save
      redirect_to edit_show_path(@performance.show)
    else
      render :new
    end
  end
  
end
