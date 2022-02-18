module PlantsHelper
  def default_plant_photo(plant)
    if plant.photo.attached?
      plant.photo[0].variant resize: "200x200"
    else
      'missing.png'
    end
  end
end