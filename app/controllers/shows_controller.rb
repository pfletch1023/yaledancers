class ShowsController < ApplicationController
  
  respond_to :html, :json
  
  def index
    @shows = Show.order("updated_at DESC").first(3)
    respond_with @shows
  end
  
  def new
    @show = Show.new
  end
  
  def create
    @show = Show.new(params[:show])
    if @show.save
      redirect_to shows_path
    else
      render :new
    end
  end
  
  def edit
    @show = Show.find(params[:id])
  end
  
  def update
    @show = Show.find(params[:id])
    if @show.update_attributes(params[:show])
      redirect_to shows_path
    else
      render :edit
    end
  end
  
end
