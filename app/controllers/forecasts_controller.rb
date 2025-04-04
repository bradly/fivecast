class ForecastsController < ApplicationController
  def new
    @forecast = Forecast.new
  end

  def create
    @forecast = Forecast.new(forecast_params)

    if @forecast.save!
      redirect_to @forecast
    else
      flash.now[:alert] = "There was a problem getting the forecast for this location"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def forecast_params
    params.expect(forecast: { location_attributes: :zipcode })
  end
end
