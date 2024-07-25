class Api::V1::UnitsController < ApplicationController
  def index
    units = Unit.all
    render json: UnitSerializer.format_units(units)
  end
  
end