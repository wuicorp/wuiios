module WuiApi
  def self.config
    @config ||= Configuration.new
  end

  def self.env
    @env ||= ENV['wui_api']
  end

  class Configuration
    attr_accessor :site, :client_id, :client_secret

    def initialize
      @site = WuiApi.env['site']
      @client_id = WuiApi.env['client_id']
      @client_secret = WuiApi.env['client_secret']
    end
  end
end
