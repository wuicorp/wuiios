class User
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable

  columns :access_token, :external_id, :email, :password, :password_confirmation

  validate :email, presence: true, email: true
  validate :password, presence: true, confirmation: true, if: :new?

  def new?
    external_id.nil?
  end
end
