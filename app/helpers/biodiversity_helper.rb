module BiodiversityHelper
    def byline(entity)
        " on #{entity.measured_on.to_formatted_s(:long)} at #{entity.measured_at.to_formatted_s(:ampm)}"
    end
end