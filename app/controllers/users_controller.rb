class UsersController < ApplicationController

  before_action :logged_in_user
  before_action :correct_user, only: [:show, :edit, :update]
  skip_before_action :logged_in_user, only: [:new, :create]

  def index
  end

  def new
    if is_logged_in?
      redirect_to root_path
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Congrats! You are signed up."
      # session[:user_id] = @user.id
      log_in(@user)
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "There was an issue during the sign-up process. Please try again."
      render :new
    end
  end

  def show
    # raise
  end

  def edit
  end

  def update
    # raise params.inspect
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      # log_out
      # flash[:alert] = "Please Sign in."
      redirect_to root_path
    end
  end


end
