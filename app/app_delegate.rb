class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    return true if RUBYMOTION_ENV == 'test'
    open SignupScreen.new(nav_bar: false)
  end
end
