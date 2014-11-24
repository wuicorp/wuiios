module MotionModel
  module Validatable
    def validate_confirmation(field, value, setting)
      confirmation = send("#{field}_confirmation")
      unless confirmation == value
        message = "wrong confirmation for #{field} -- check the value of #{field}_confirmation."
        add_message(field, message)
        return false
      end
      true
    end
  end
end
