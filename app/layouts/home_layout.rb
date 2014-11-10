class SignupLayout < MK::Layout
  def layout
    root :signup do
      add UIImageView, :signup_image
    end
  end

  def signup_style
    background_color '#6666F9'.uicolor
  end

  def signup_image_style
    image 'jimcarrey'.uiimage
    clips_to_bounds true

    layer do
      corner_radius 50.0
    end

    constraints do
      left 20
      top 84
      width 100
      height 100
    end
  end
end
