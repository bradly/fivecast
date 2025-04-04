require "test_helper"

class LocationTest < ActiveSupport::TestCase
  test "it creates a forecast when created" do
    location = Location.create(zipcode: 10001)
    assert_equal location.forecasts.size, 1
  end

  test "latest forecast returns the latest forecast" do
    location = Location.create(zipcode: 10002)
    location.forecasts.create
    latest_forecast = location.forecasts.create

    assert_equal location.latest_forecast, latest_forecast
  end
end
