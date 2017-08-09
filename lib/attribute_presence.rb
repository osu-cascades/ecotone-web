module AttributePresence
  # Append the 'in' class so that the initial state of the collapse is visible.
  # For example, when the user has entered sample values during a failed
  # create, failed update, or edit, the fields should be visible by default,
  # rather than collapsed.
  # Note: In Bootstrap 4, 'in' has changed to 'show'.
  def visibility_class
    return false if self.nil?
    has_any_present_attributes? && 'in'
  end

  def has_any_present_attributes?
    attributes.each { |name, value| return true if name != "biodiversity_report_id" && value.present? }
    return false
  end

end