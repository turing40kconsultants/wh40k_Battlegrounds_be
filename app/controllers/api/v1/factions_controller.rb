class Api::V1::FactionsController < ApplicationController
  def index
    factions = Faction.all
    render json: FactionSerializer.format_factions(factions)
  end

  def show
    #faction's units
    faction = Faction.find(params[:faction_id])
    render json: UnitSerializer.format_units(faction.units)
  end
end