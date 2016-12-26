class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !has_min_tickets? && !has_min_height?
      "Sorry. You do not have enough tickets the #{attraction_name}. You are not tall enough to ride the #{attraction_name}."
    elsif !has_min_tickets?
      "Sorry. You do not have enough tickets the #{attraction_name}."
    elsif !has_min_height?
      "Sorry. You are not tall enough to ride the #{attraction_name}."
    else
      user_pf_tickets
      user_pf_nausea
      user_pf_happiness
    end
  end

  private

  def attraction_name
    self.attraction.name
  end

  def has_min_tickets?
    self.user.tickets > self.attraction.tickets
  end

  def has_min_height?
    self.user.height > self.attraction.min_height
  end

  def user_pf_tickets
    self.user.tickets -= self.attraction.tickets
    self.user.save
  end

  def user_pf_nausea
    self.user.nausea += self.attraction.nausea_rating
    self.user.save
  end

  def user_pf_happiness
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
  end

end
