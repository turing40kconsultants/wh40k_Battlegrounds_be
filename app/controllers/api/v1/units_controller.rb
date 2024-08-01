class Api::V1::UnitsController < ApplicationController
  # def index
  #   # units = Unit.all
  #   # render json: UnitSerializer.format_units(units)
  # end

  def show
    unit = Unit.find(params[:id])
    render json: UnitSerializer.format_unit(unit)
  end
end