require 'rails_helper'

describe "Wh40k_Battlegrounds API" do
  it "sends a list of factions" do
    faction = Faction.create(name: "Necrons")
    faction2 = Faction.create(name: "Blood Angels")
    factions = Factions.all

    get '/api/v1/factions'

    expect(response).to be_successful
    expect(response.status).to eq (200)

    factions = JSON.parse(response.body, symbolize_names: true)

    expect(factions.count).to eq(2)

    factions.each do |faction|
      expect(faction).to have_key(:id)
      expect(faction[:id]).to be_an(Integer)

      expect(faction).to have_key(:name)
      expect(faction[:name]).to be_a(String)
    end
  end

  it "can get all units for a given faction ID" do
    faction = Faction.create(name: "Necrons")
    unit1 = Unit.create(name: "C'tan Shard of the Nightbringer", movement: 6, toughness: 11, sv: 4, wounds: 12, leadership: 6, objective_control: 6, faction_id: faction.id)
    unit2 = Unit.create(name: 'Orikan the Diviner', movement: 5, toughness: 4, sv: 4, wounds: 4, leadership: 6, objective_control: 1, faction_id: faction.id)
    unit3 = Unit.create(name: 'Skorpekh Lord', movement: 8, toughness: 7, sv: 3, wounds: 7, leadership: 6, objective_control: 2, faction_id: faction.id)
    unit4 = Unit.create(name: 'Trazyn the Infinite', movement: 5, toughness: 5, sv: 2, wounds: 6, leadership: 6, objective_control: 1, faction_id: faction.id)


    get "/api/v1/factions/#{faction.id}/units"
    
    expect(response).to be_successful
    expect(response.status).to eq (200)
    
    faction_units = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(faction_units.count).to eq(4)

    faction_units.each do |faction_units|
      expect(faction_units).to have_key(:id)
      expect(faction_units[:id]).to be_a(String)
  
      expect(faction_units[:attributes]).to have_key(:name)
      expect(faction_units[:attributes][:name]).to be_a(String)
  
      expect(faction_units[:attributes]).to have_key(:movement)
      expect(faction_units[:attributes][:movement]).to be_a(Integer)
  
      expect(faction_units[:attributes]).to have_key(:toughness)
      expect(faction_units[:attributes][:toughness]).to be_a(Integer)
  
      expect(faction_units[:attributes]).to have_key(:sv)
      expect(faction_units[:attributes][:sv]).to be_a(Integer)

      expect(faction_units[:attributes]).to have_key(:wounds)
      expect(faction_units[:attributes][:wounds]).to be_a(Integer)

      expect(faction_units[:attributes]).to have_key(:leadership)
      expect(faction_units[:attributes][:leadership]).to be_a(Integer)

      expect(faction_units[:attributes]).to have_key(:objective_control)
      expect(faction_units[:attributes][:objective_control]).to be_a(Integer)
    end
  end
end