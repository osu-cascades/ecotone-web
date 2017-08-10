module BiodiversityReportsHelper

  def link_to_toggle_sample_fields_for(sample)
    return unless sample
    verb = sample.has_any_present_attributes? ? 'Omit' : 'Add'
    link_to "#{verb} #{sample.model_name.human.downcase}", "##{sample.class.name.underscore}_fields",
      { id: "lnk-toggle-#{sample.class.name.underscore.dasherize}-fields", 'data-toggle': 'collapse' }
  end

  def link_to_add_fields(link_text, form_builder, association)
    new_object = form_builder.object.send(association).klass.new
    id = new_object.object_id
    fields = form_builder.fields_for(association, new_object, child_index: id) do |fields_builder|
      render(association.to_s.singularize + "_fields", f: fields_builder)
    end
    link_to(link_text, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def visibility_class(sample)
    return false if sample.nil?
    sample.has_any_present_attributes? && 'in'
  end

end
