class UserService
  class << self
    def self.create(attributes, &block)
      user = User.new(attributes)

      unless user.valid?
        block.call(user)
        return
      end

      api.post('/api/v1/sign_up', to_provider(user)) do |response|
        if response.ok?
          from_provider!(user, response)
          User.serialize_to_file('user') if user.save
          block.call(user)
        else
          p response
          errors_from_provider!(user, response)
          block.call(user)
        end
      end
    end

    def from_provider!(user, response)
      user.tap do |u|
        u.access_token = response['access_token']
        u.external_id = response['user']['id']
      end
    end

    def to_provider(user)
      {
        user: {
          email: user.email,
          password: user.password,
          password_confirmation: user.password_confirmation
        }
      }
    end

    def errors_from_provider!(user, response)
      errors = BW::JSON.parse(response.body.to_str)
      errors.each do |k, v|
        v.each do |value|
          user.add_message(k.to_sym, value)
        end
      end
    end

    def api
      @api ||= OAuth2Motion::Client.new(client_id: client_id,
                                        client_secret: client_secret,
                                        site: site)
    end

    def client_id
      '4f21e899f10c3084cbc295a3d4f49633419f3ef1e8e161c1436340980451049e'
    end

    def client_secret
      'abf8dec00e1d5ff029ad4f01c6aec0faf0a01844f6c9d42e41e814a6c16348ea'
    end

    def site
      'http://localhost:3000'
    end
  end
end
