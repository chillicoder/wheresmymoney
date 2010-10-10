module AnalyticsInitializer
  def self.registered(app)
    app.use Rack::GoogleAnalytics, :tracker => 'UA-19023488-1'

  end
end
