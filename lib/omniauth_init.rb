require 'openid/store/filesystem'

module OmniauthInitializer
  def self.registered(app)
    app.use OmniAuth::Builder do
      provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
      provider :facebook, 'APP_ID', 'APP_SECRET'
      provider :open_id, OpenID::Store::Filesystem.new('tmp')
      provider :google_apps, OpenID::Store::Filesystem.new('tmp')
    end
  end
end
