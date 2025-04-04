class Location < ApplicationRecord
  # TODO: Use a Normalizer to collapse XXXXX-XXXX format to a single location
  validates :zipcode, presence: true, format: { with: /\A\d{5}\z/i }

  has_many :forecasts, dependent: :destroy

  after_create { forecasts.create! }

  def latest_forecast
    forecast = forecasts.order(created_at: :desc).take
    forecast.blank? || forecast.stale? ? forecasts.create! : forecast
  end
end
