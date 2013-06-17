require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'rack/throttle'
require 'redis'
require 'date'

describe "Redis Cache Interaction" do
  include Rack::Test::Methods

  def app
    @target_app ||= example_target_app
    @app ||= Rack::Throttle::Hourly.new @target_app, :min => 0.1, :cache => Redis.new
    @cache = @app.options[:cache]
    @app
  end

  it "should set an expiry time" do
    get "/foo"
    cache_date_key = "127.0.0.1:#{Date.today}"
    @cache.ttl(cache_date_key).should be_an_instance_of Fixnum
    @cache.ttl(cache_date_key).should < @app.class.default_ttl
  end
end