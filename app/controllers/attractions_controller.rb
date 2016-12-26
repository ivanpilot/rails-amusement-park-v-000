class AttractionsController < ApplicationController
  before_action :logged_in_user

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

end
