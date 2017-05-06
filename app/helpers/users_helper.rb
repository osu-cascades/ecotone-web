module UsersHelper

  def delete_user_link(current_user, user)
    if admin?(current_user) && !current_user?(user)
      "| #{link_to "delete", user, method: :delete, data: { confirm: "Delete #{user.name}?" }, class: "lnk-danger"}".html_safe
    end
  end

end
