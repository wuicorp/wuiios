class SignupScreen < PM::Screen
  title 'Sign Up'

  def on_load
    @layout = SignupLayout.new(root: self.view).build

    @legacy_button = @layout.legacy_button
    @legacy_button.on(:touch) { legacy_signup }

    @phone_number_field = @layout.phone_number_field
    @phone_prefix_field = @layout.phone_prefix_field
  end

  def legacy_signup
    attributes = {
      phone_prefix: @phone_prefix_field.text,
      phone_number: @phone_number_field.text
    }

    UserService.create(attributes) do |user|
      if user.error_messages.empty?
        open HomeScreen
      else
        ValidationAlertView.alert(user.error_messages)
      end
    end
  end
end
