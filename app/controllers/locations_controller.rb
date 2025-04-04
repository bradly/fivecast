class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.find_or_initialize_by(location_params)

    if @location.persisted?
      flash.notice = "This location already exists."
      redirect_to @location
    elsif @location.save
      flash.notice = "Location added."
      redirect_to @location
    else
      flash.alert = "There was a problem saving this location"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @location = Location.find(params[:id])
    @latest_forecast = @location.latest_forecast
    @cached_at = @location.latest_forecast.created_at
  end

  private

  def location_params
    params.expect(location: [:zipcode])
  end
end
