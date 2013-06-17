require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'rack/throttle'
require 'redis'

describe "Redis Cache Interaction" do
  include Rack::Test::Methods

  def app
    @target_app ||= example_target_app
    @app ||= Rack::Throttle::Interval.new(@target_app, :min => 0.1, :cache => Redis.new)
    @cache = @app.options[:cache]
  end

  context "When the cache respondes to :expire (as redis does)"
  it "should set an expiry time" do

  end
end