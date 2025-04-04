class Forecast < ApplicationRecord
  CACHE_TTL = 30.minutes

  DATA_ATTRS = [
    :current_temp,
    :unit,
  ]

  belongs_to :location
  accepts_nested_attributes_for :location

  before_create {
    data = client.data.slice(*DATA_ATTRS)
    assign_attributes(data)
  }

  def stale?
    created_at.before?(CACHE_TTL.ago)
  end

  private

  def client
    @client ||= ExternalThirdPartyWeatherApiThatIsExpensiveInCostAndTime::Api::Client.new(zipcode: location.zipcode)
  end
end
