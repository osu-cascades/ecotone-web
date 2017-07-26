module BiodiversityReportsHelper

  def link_to_toggle_sample_fields_for(sample)
    return unless sample
    verb = has_any_present_attributes?(sample) ? 'Omit' : 'Add'
    link_to "#{verb} #{format_class_name(sample.class.name)} sample", "##{format_class_name(sample.class.name)}_fields",
      { id: "lnk-toggle-#{format_class_name(sample.class.name)}-fields", 'data-toggle': 'collapse' }
  end

  # Append the 'in' class so that the initial state of the collapse is visible.
  # For example, when the user has entered sample values during a failed
  # create, failed update, or edit, the fields should be visible by default,
  # rather than collapsed.
  # Note: In Bootstrap 4, 'in' has changed to 'show'.
  def show_css_class(sample)
    has_any_present_attributes?(sample) && 'in'
  end

  def link_to_add_fields(link_text, form_builder, association)
    new_object = form_builder.object.send(association).klass.new
    id = new_object.object_id
    fields = form_builder.fields_for(association, new_object, child_index: id) do |fields_builder|
      render(association.to_s.singularize + "_fields", f: fields_builder)
    end
    link_to(link_text, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  private

  def format_class_name(str)
    object = str.split /(?=[A-Z])/
    object[0].downcase
  end

  def has_any_present_attributes?(obj)
    return nil if obj.nil?
    obj.attributes.each do |_, attr_value|
      if attr_value.present?
        return true
      end
    end
    false
  end

end
