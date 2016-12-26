class WelcomeController < ApplicationController

  before_action :home_page_if_logged_in
  def index
  end

end
