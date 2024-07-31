class Api::V1::FactionsController < ApplicationController
  def index
    factions = Faction.all
    if factions
      render json: FactionSerializer.format_factions(factions)
    else 
      render json: { message: 'Request Error - No Factions Found' }, status: :not_found
    end
  end

  def show
    #faction's units
    faction = Faction.find(params[:faction_id])
    if faction
      render json: UnitSerializer.format_units(faction.units)
    else
      render json: { message: 'Faction not found' }, status: :not_found
    end
  end
end