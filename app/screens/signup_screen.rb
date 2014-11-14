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
    api.post(legacy_path, params) do |response|
      CurrentUser.create_from_response(response.body)
      User.serialize_to_file('current_user')
    end
  end

  def api
    @api ||= OAuth2Motion::Client.new(
      client_id: '4f21e899f10c3084cbc295a3d4f49633419f3ef1e8e161c1436340980451049e',
      client_secret: 'abf8dec00e1d5ff029ad4f01c6aec0faf0a01844f6c9d42e41e814a6c16348ea',
      site: 'http://localhost:3000'
    )
  end

  def legacy_path
    '/api/v1/sign_up'
  end

  def params
    { user: {
        email: @email_field.text,
        password: @password_field.text,
        password_confirmation: @password_confirmation_field.text
    }}
  end

  def facebook_signup
    puts 'Sign up with Facebook'
  end
end
