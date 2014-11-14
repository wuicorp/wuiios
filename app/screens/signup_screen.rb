class SignupScreen < PM::Screen
  title 'Sign Up'

  def on_load
    @layout = SignupLayout.new(root: self.view).build

    @legacy_button = @layout.legacy_button
    @legacy_button.on(:touch) { legacy_signup }

    @fb_button = @layout.fb_button
    @fb_button.on(:touch) { facebook_signup }
  end

  def legacy_signup
    puts 'Sign up with WUI Guardians'
  end

  def facebook_signup
    puts 'Sign up with Facebook'
  end
end
