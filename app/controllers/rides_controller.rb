class RidesController < ApplicationController

  def create
    @ride = Ride.new(ride_params)
    @ride.user = current_user
    # raise params.inspect

    if @ride.save
      # @ride.take_ride
      flash[:alert] = @ride.take_ride
      redirect_to user_path(@ride.user)
    else
      flash[:alert] = "Failure to take the ride."
      redirect_to attraction_path(@ride.attraction)
    end

  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id)
  end

end
