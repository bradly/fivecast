require "test_helper"

class ForecastTest < ActiveSupport::TestCase
  test "#stale? is true if after 30 minutes old" do
    forecast = Forecast.new(created_at: 31.minutes.ago)
    assert_predicate forecast, :stale?
  end

  test "#stale? is not true if before 30 minutes old" do
    forecast = Forecast.new(created_at: 29.minutes.ago)
    refute_predicate forecast, :stale?
  end

  test "#stale? is not true if exactly 30 minutes old" do
    freeze_time do
      forecast = Forecast.new(created_at: 30.minutes.ago)
      refute_predicate forecast, :stale?
    end
  end

  test "sets data on save" do
    stub_client_data({ 
      current_temp: 72,
      unit: "F",
    })

    forecast = Location.create!(zipcode: 12345).forecasts.take!

    assert_equal forecast.current_temp, 72
    assert_equal forecast.unit, "F"
  end

  private

  def stub_client_data(value)
    ExternalThirdPartyWeatherApiThatIsExpensiveInCostAndTime::Api::Client
      .any_instance
      .stubs(:data)
      .returns(value)
  end
end
