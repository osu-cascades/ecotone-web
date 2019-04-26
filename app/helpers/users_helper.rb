module UsersHelper
  def current_user?(current_user, user)
    !user.nil? && user == current_user
  end

  def delete_user_link(current_user, user)
    if current_user&.admin? && !current_user?(current_user, user)
      "#{link_to 'delete', user, method: :delete, data: { confirm: "Delete #{user}?" }, class: 'btn btn-danger', title: "Delete #{user}"}".html_safe
    end
  end
end
