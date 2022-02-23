module PlantsHelper
  def photo(plant, idx = 0)
    if plant.photo.attached?
      plant.photo[idx]
    else
      'missing.png'
    end
  end
end