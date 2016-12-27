class AttractionsController < ApplicationController
  before_action :logged_in_user

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
    authorize @attraction
  end

  def create
    @attraction = Attraction.new(attraction_params)
    authorize @attraction
    if @attraction.save
      flash[:success] = "Congrats! You successfully created a new attraction."
      redirect_to attraction_path(@attraction)
    else
      flash.now[:alert] = "You are not authorize to create new attractions."
      render :new
    end
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new(attraction_id: params[:id])
  end

  def edit
    @attraction = Attraction.find_by(id:params[:id])
    authorize @attraction
  end

  def update
    @attraction = Attraction.find_by(id:params[:id])
    authorize @attraction
    @attraction.update(attraction_params)
    flash[:success] = "Congrats! You successfully updated #{@attraction.name}."
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end

end
