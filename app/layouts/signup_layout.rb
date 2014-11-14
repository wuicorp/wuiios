class SignupLayout < MK::Layout
  view :legacy_button, :fb_button,
       :username_field, :password_field, :password_confirmation_field

  def layout
    root :signup do
      add UIImageView, :logo

      add UIView, :register_view do
        @fb_button = add UIButton, :fb_button
        @email_field = add UITextField, :email_field
        @password_field = add UITextField, :password_field
        @password_confirmation_field = add UITextField, :password_confirmation_field
        @legacy_button = add UIButton, :legacy_button
      end
    end
  end

  def signup_style
    background_color '#aaccff'.uicolor
  end

  def logo_style
    frame [[0, 0], ['100%', '100%']]
    image 'logo.png'.uiimage
  end

  def register_view_style
    frame from_center(down: 100, size: ['100%', 400])
  end

  def fb_button_style
    title 'Facebook sign up'

    background_color '#51A8E7'.uicolor

    layer do
      corner_radius 7.0
      shadow_color '#000000'.cgcolor
      shadow_opacity 0.9
      shadow_radius 2.0
      shadow_offset [0, 0]
    end

    frame [[20, 10], ['100% - 40', :auto]]
  end

  def email_field_style
    placeholder 'Your email here'
    style_for_text_field
    frame [[20, 100], ['100% - 40', 40]]
  end

  def password_field_style
    placeholder 'Password'
    style_for_text_field
    frame [[20, 150], ['100% - 40', 40]]
  end

  def password_confirmation_field_style
    placeholder 'Password confirmation'
    style_for_text_field
    frame [[20, 200], ['100% - 40', 40]]
  end

  def legacy_button_style
    title 'WUI Guardians sign up'

    background_color '#51A8E7'.uicolor

    layer do
      corner_radius 7.0
      shadow_color '#000000'.cgcolor
      shadow_opacity 0.9
      shadow_radius 2.0
      shadow_offset [0, 0]
    end

    frame [[20, 250], ['100% - 40', :auto]]
  end

  def style_for_text_field
    background_color '#ffffff'.uicolor
    layer do
      corner_radius 7.0
      shadow_color '#000000'.cgcolor
      shadow_opacity 0.9
      shadow_radius 2.0
      shadow_offset [0, 0]
    end
  end
end
