class Api::V1::FactionsController < ApplicationController
  def index
    factions = Faction.all
    render json: FactionSerializer.format_factions(factions)
  end

  def show
    #essentially the factions units
    faction = Faction.find{params[:id]}
    render json: UnitSerializer.format_units(faction.units)
  end
end