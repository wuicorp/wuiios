class User
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable

  columns :access_token, :external_id, :phone_number

  validate :phone_number, presence: true
end
