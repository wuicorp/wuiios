class User
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable

  columns :access_token, :external_id, :phone_prefix, :phone_number
end
