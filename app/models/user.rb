class CurrentUser
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter

  columns :access_token, :id, :email

  def self.create_from_response(body)
    response = BW::JSON.parse(body.to_str)

    create(access_token: response['access_token'],
           id: response['user']['id'],
           email: response['user']['email'])
  end
end
