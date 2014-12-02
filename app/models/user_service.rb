class UserService
  class << self
    def create(attributes, &block)
      user = User.new(attributes)

      unless user.valid?
        block.call(user)
        return
      end

      api.post('/api/v1/sign_up', to_provider(user)) do |response|
        if response.ok?
          params = BW::JSON.parse(response.body.to_str)
          from_provider!(user, params)
          User.serialize_to_file('user') if user.save
          block.call(user)
        else
          p response
          errors_from_provider!(user, response)
          block.call(user)
        end
      end
    end

    def from_provider!(user, params)
      user.tap do |u|
        u.access_token = params['access_token']
        u.external_id = params['user']['id']
      end
    end

    def to_provider(user)
      { user:
        { phone_number: user.phone_number, phone_prefix: user.phone_prefix }
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
      WuiApi.config.client_id
    end

    def client_secret
      WuiApi.config.client_secret
    end

    def site
      WuiApi.config.site
    end
  end
end
