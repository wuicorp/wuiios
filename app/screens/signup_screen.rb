class SignupScreen < PM::Screen
  title 'Sign Up'

  def on_load
    @layout = SignupLayout.new(root: self.view).build
  end
end
