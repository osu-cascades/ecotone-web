module PlotsHelper

  def link_to_featured_plant(plot)
    if plot.featured_plant
      link_to plot.featured_plant_name, plant_path(plot.featured_plant)
    else
      "Unassigned. #{link_to "Add one?", edit_plot_path(plot)}".html_safe
    end
  end

end
