module UsersHelper

  def delete_user_link(current_user, user)
    if current_user&.admin? && !current_user?(user)
      "| #{link_to "delete", user, method: :delete, data: { confirm: "Delete #{user.name}?" }, class: "lnk-danger"}".html_safe
    end
  end

  def edit_user_link(current_user, user)
    if current_user&.admin? || current_user?(user)
      link_to "Edit", edit_user_path(user), class: "btn btn-primary edit-btn"
    end
  end

end
