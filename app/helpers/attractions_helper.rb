module AttractionsHelper

  def display_attraction_for(attraction, user)
    if user.admin?
      link_to("Show #{attraction.name}", attraction_path(attraction))
    else
      link_to("Go on #{attraction.name}", attraction_path(attraction))
    end
  end

end
