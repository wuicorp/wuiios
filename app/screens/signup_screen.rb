class SignupScreen < PM::Screen
  title 'Sign Up'

  def on_load
    @layout = SignupLayout.new(root: self.view).build

    @legacy_button = @layout.legacy_button
    @legacy_button.on(:touch) { legacy_signup }

    @fb_button = @layout.fb_button
    @fb_button.on(:touch) { facebook_signup }

    @email_field = @layout.email_field
    @password_field = @layout.password_field
    @password_confirmation_field = @layout.password_confirmation_field
  end

  def legacy_signup
    attributes = {
      email: @email_field.text,
      password: @password_field.text,
      password_confirmation: @password_confirmation_field.text
    }

    UserService.create(attributes) do |user|
      if user.error_messages
        ValidationAlertView.alert(user.error_messages)
      else
        p 'go home!!'
      end
    end
  end

  def facebook_signup
    puts 'Sign up with Facebook'
  end
end
