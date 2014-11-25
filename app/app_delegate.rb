class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    return true if RUBYMOTION_ENV == 'test'

    User.deserialize_from_file('user')

    if current_user
      open HomeScreen
    else
      open SignupScreen.new(nav_bar: false)
    end
  end

  def current_user
    @current_user = User.find { |user| !user.access_token.empty? }.first
  end
end
