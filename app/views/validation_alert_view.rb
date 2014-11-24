class ValidationAlertView
  def self.alert(validation_errors)
    errors = validation_errors.map(&:values).flatten
    UIAlertView.alert('Invalid values', errors.first)
  end
end
