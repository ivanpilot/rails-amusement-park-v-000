class AttractionsController < ApplicationController
  before_action :logged_in_user

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.save
      flash[:success] = "Congrats! You successfully created a new attraction."
      redirect_to attraction_path(attraction)
    else
      flash.now[:alert] = "You are not authorize to create new attractions."
      render :new
    end
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new(attraction_id: params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end

end
