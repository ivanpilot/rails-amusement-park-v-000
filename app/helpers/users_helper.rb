module UsersHelper

  def capitalize_name(user_name)
    user_name.split(' ').collect {|name| name.capitalize}.join(' ')
  end

  def admin?(user)
    user.admin?
  end

  def display_admin(user)
    if admin?(user)
      "User Category: ADMIN"
    end
  end

end
