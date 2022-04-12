module PlotsHelper
  def link_to_featured_plant(plot)
    if plot.featured_plant
      link_to(plot.featured_plant_name.titleize, plant_path(plot.featured_plant), title: "Details of #{plot.featured_plant_name}")
    elsif current_user&.admin?
      "Unassigned. #{link_to("Add one?", edit_plot_path(plot), title: "Edit #{plot}")}".html_safe
    else
      'n/a'
    end
  end
end
