module UsersHelper

  def delete_user_link(current_user, user)
    if current_user&.admin? && !current_user?(user)
      "| #{link_to "delete", user, method: :delete, data: { confirm: "Delete #{user}?" }, class: "lnk-danger", title: "Delete #{user}"}".html_safe
    end
  end

  def edit_user_link(current_user, user)
    if current_user&.admin? || current_user?(user)
      link_to "Edit Account", edit_user_path(user), class: "btn btn-primary btn-user-edit", title: "Edit #{user}"
    end
  end

end
