module PlantsHelper
  def photo(plant)
    if plant.photo.attached?
      plant.photo[0]
    else
      'missing.png'
    end
  end
end