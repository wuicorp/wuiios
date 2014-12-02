class SignupLayout < MK::Layout
  view :legacy_button, :phone_prefix_field, :phone_number_field

  def layout
    root :signup do
      add UIImageView, :logo

      add UIView, :register_view do
        add UILabel, :prefix_label
        @phone_prefix_field = add UITextField, :phone_prefix_field
        @phone_number_field = add UITextField, :phone_number_field
        @legacy_button = add UIButton, :legacy_button
      end
    end
  end

  def signup_style
    background_color '#aaccff'.uicolor
  end

  def logo_style
    frame [[0, 0], ['100%', '50%']]
    image 'logo.png'.uiimage
  end

  def register_view_style
    frame from_center(down: 100, size: ['100%', 400])
  end

  def prefix_label_style
    text '+'
    text_color '#000000'.uicolor
    frame [[20, 150], [30, 40]]
  end

  def phone_prefix_field_style
    placeholder '34'
    style_for_text_field
    keyboardType UIKeyboardTypeNumberPad
    frame [[40, 150], [40, 40]]
  end

  def phone_number_field_style
    placeholder 'Your phone number here'
    style_for_text_field
    keyboardType UIKeyboardTypeNumberPad
    frame [[80, 150], [200, 40]]
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

    frame [[20, 200], ['100% - 40', :auto]]
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
