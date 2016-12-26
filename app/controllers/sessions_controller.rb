class SessionsController < ApplicationController

  def new
    if is_logged_in?
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user && user.try(:authenticate, params[:user][:password])
      flash[:success] = "You successfully logged in."
      log_in(user)
      redirect_to user_path(user)
    else
      flash.now[:alert] = "Wrong combination name/password. Please Try again."
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
