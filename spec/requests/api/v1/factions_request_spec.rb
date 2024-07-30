require 'rails_helper'

describe "Wh40k_Battlegrounds API" do

  before :each do 
#create 2 factions
@necrons = Faction.create!(name: 'Necrons')
@dark_angels = Faction.create!(name: 'Dark Angels')

#create 4 Necron units
@nigthbringer = Unit.create!(name: "C'Tan Shard of the Nightbringer", 
                            movement: 6, 
                            toughness: 11, 
                            sv: 4,
                            invul_sv: 4,
                            wounds: 12, 
                            leadership: 6, 
                            objective_control: 4, 
                            faction: @necrons)

@skorpekh = Unit.create!(name: 'Skorpekh Destroyers',
                        movement: 8, 
                        toughness: 6, 
                        sv: 3,
                        invul_sv: nil,
                        wounds: 3, 
                        leadership: 7, 
                        objective_control: 2, 
                        faction: @necrons)

@lychguard = Unit.create!(name: 'Lychguard',
                        movement: 5, 
                        toughness: 5, 
                        sv: 3,
                        invul_sv: nil,
                        wounds: 2, 
                        leadership: 7, 
                        objective_control: 1, 
                        faction: @necrons)

@immortal = Unit.create!(name: 'Immortals',
                        movement: 5, 
                        toughness: 5, 
                        sv: 3,
                        invul_sv: nil,
                        wounds: 1, 
                        leadership: 7, 
                        objective_control: 2, 
                        faction: @necrons)

#create 4 Dark Angels units
@thelion = Unit.create!(name: "Lion El'Johnson",
                        movement: 8,
                        toughness: 9,
                        sv: 2,
                        invul_sv: 3,
                        wounds: 10,
                        leadership: 5,
                        objective_control: 4,
                        faction: @dark_angels)
                        
@dw_knight = Unit.create!(name: 'Deathwing Knight',
                        movement: 5,
                        toughness: 5,
                        sv: 2,
                        invul_sv: 4,
                        wounds: 4,
                        leadership: 6,
                        objective_control: 1,
                        faction: @dark_angels)

@inner_circle_c = Unit.create!(name: 'Inner Circle Companion',
                              movement: 6,
                              toughness: 4,
                              sv: 3,
                              wounds: 3,
                              leadership: 6,
                              objective_control: 2,
                              faction: @dark_angels)

@asmodai = Unit.create!(name: 'Asmodai',
                      movement: 6,
                      toughness: 4,
                      sv: 3,
                      invul_sv: 4,
                      wounds: 4,
                      leadership: 5,
                      objective_control: 1,
                      faction: @dark_angels)

#necron weapons

@Scythe_of_the_Nightbringer_strike = Weapon.create!(name: 'Scythe of the Nightbringer - strike', 
                                                    attacks: 6, 
                                                    ws: 2, 
                                                    strength: 14, 
                                                    ap: 4, 
                                                    damage: "D6+2",
                                                    range: 0)

@Scythe_of_the_Nightbringer_sweep = Weapon.create!(name: 'Scythe of the Nightbringer - sweep', 
                                                    attacks: 14, 
                                                    ws: 2, 
                                                    strength: 8, 
                                                    ap: 2, 
                                                    damage: 2,
                                                    range: 0)                                                                                                        

@skorpekh_hyperphase = Weapon.create!(name: 'Skorpekh Hyperphase Weapons', 
                                                    attacks: 4, 
                                                    ws: 3, 
                                                    strength: 7, 
                                                    ap: 2, 
                                                    damage: 2,
                                                    range: 0)                                                                                                        

@hyperphase_sword = Weapon.create!(name: 'Hyperphase Sword', 
                                  attacks: 3, 
                                  ws: 3, 
                                  strength: 6, 
                                  ap: 2, 
                                  damage: 1,
                                  range: 0)                                                                    

@warscythe = Weapon.create!(name: 'Warscythe', 
                          attacks: 2, 
                          ws: 3, 
                          strength: 8, 
                          ap: 3, 
                          damage: 2,
                          range: 0)                                              

@close_combat_weapon_necron = Weapon.create!(name: 'Close Combat Weapon', 
                          attacks: 2, 
                          ws: 3, 
                          strength: 4, 
                          ap: 0, 
                          damage: 1,
                          range: 0)                                                 

#necron weapon to characteer associations

@weapon_unit_nigthbringer_melee1 = WeaponUnit.create!(unit: @nigthbringer, weapon: @Scythe_of_the_Nightbringer_strike)
@weapon_unit_nigthbringer_melee2 = WeaponUnit.create!(unit: @nigthbringer, weapon: @Scythe_of_the_Nightbringer_sweep)
@weapon_unit_skorpekh = WeaponUnit.create!(unit: @skorpekh, weapon: @skorpekh_hyperphase)
@weapon_unit_lychguard_melee1 = WeaponUnit.create!(unit: @lychguard, weapon: @hyperphase_sword)
@weapon_unit_lychguard_melee2 = WeaponUnit.create!(unit: @lychguard, weapon: @warscythe)
@weapon_unit_immortals = WeaponUnit.create!(unit: @immortal, weapon: @close_combat_weapon_necron)

#dark angels weapons

@fealty_strike = Weapon.create!(name: 'Fealty - Strike',
                              attacks: 8,
                              ws: 2,
                              strength: 12,
                              ap: 4,
                              damage: 4,
                              range: 0)

@fealty_sweep = Weapon.create!(name: 'Fealty - sweep',
                              attacks: 16,
                              ws: 2,
                              strength: 6,
                              ap: 3,
                              damage: 1,
                              range: 0)

@great_weapon_unforgiven = Weapon.create!(name: 'Great weapon of the unforgiven',
                              attacks: 5,
                              ws: 2,
                              strength: 6,
                              ap: 2,
                              damage: 2,
                              range: 0)

@mace_absolution = Weapon.create!(name: 'Mace of absolution',
                              attacks: 4,
                              ws: 2,
                              strength: 6,
                              ap: 2,
                              damage: 2,
                              range: 0)

@power_weapon_dwk = Weapon.create!(name: 'Power weapon',
                              attacks: 5,
                              ws: 2,
                              strength: 6,
                              ap: 2,
                              damage: 2,
                              range: 0)

@relic_weapon_dwk = Weapon.create!(name: 'Relic weapon',
                              attacks: 6,
                              ws: 2,
                              strength: 7,
                              ap: 2,
                              damage: 2,
                              range: 0)

@calibanite_gsword_strike = Weapon.create!(name: 'Calibanite greatsword - strike',
                              attacks: 4,
                              ws: 3,
                              strength: 6,
                              ap: 2,
                              damage: 2,
                              range: 0)

@calibanite_gsword_sweep = Weapon.create!(name: 'Calibanite greatsword - sweep',
                              attacks: 5,
                              ws: 3,
                              strength: 6,
                              ap: 2,
                              damage: 1,
                              range: 0)

@crozius_arcanum_strike = Weapon.create!(name: 'Crozius arcanum and power weapon - strike',
                                        attacks: 5,
                                        ws: 2,
                                        strength: 6,
                                        ap: 2,
                                        damage: 2,
                                        range: 0)


@crozius_arcanum_sweep = Weapon.create!(name: 'Calibanite greatsword - sweep',
                                      attacks: 8,
                                      ws: 2,
                                      strength: 6,
                                      ap: 2,
                                      damage: 1,
                                      range: 0)

#dark angels weapon to characteer associations

@weapon_unit_thelion_melee1 = WeaponUnit.create!(unit: @thelion, weapon: @fealty_strike)
@weapon_unit_thelion_melee2 = WeaponUnit.create!(unit: @thelion, weapon: @fealty_sweep)
@weapon_unit_dw_knight_melee1 = WeaponUnit.create!(unit: @dw_knight, weapon: @great_weapon_unforgiven)
@weapon_unit_dw_knight_melee2 = WeaponUnit.create!(unit: @dw_knight, weapon: @mace_absolution)
@weapon_unit_dw_knight_melee3 = WeaponUnit.create!(unit: @dw_knight, weapon: @power_weapon_dwk)
@weapon_unit_dw_knight_melee4 = WeaponUnit.create!(unit: @dw_knight, weapon: @relic_weapon_dwk)
@weapon_unit_inner_circle_c_melee1 = WeaponUnit.create!(unit: @inner_circle_c, weapon: @calibanite_gsword_strike)
@weapon_unit_inner_circle_c_melee2 = WeaponUnit.create!(unit: @inner_circle_c, weapon: @calibanite_gsword_sweep)
@weapon_unit_asmodai_melee1 = WeaponUnit.create!(unit: @asmodai, weapon: @crozius_arcanum_strike)
@weapon_unit_asmodai_melee2 = WeaponUnit.create!(unit: @asmodai, weapon: @crozius_arcanum_sweep)

#weapon abilities

@lethal_hits = WeaponAbility.create!(name: 'Lethal hits', description: 'Critical hits automatically wound the target')
@sustained_hits_1 = WeaponAbility.create!(name: 'Sustained hits 1', description: 'score 1 additional hits on a critical hit')
@sustained_hits_2 = WeaponAbility.create!(name: 'Sustained hits 2', description: 'score 2 additional hits on a critical hit')
@sustained_hits_3 = WeaponAbility.create!(name: 'Sustained hits 3', description: 'score 3 additional hits on a critical hit')
@lance = WeaponAbility.create!(name: 'Lance', description: '+1 to wound after making a charge move')
@devastating_wounds = WeaponAbility.create!(name: 'Devastating Wounds', description: 'Critical wounds inflict mortal wounds instead')
@anti_monster_4 = WeaponAbility.create!(name: 'Anti-Monster 4+', description: 'Wound rolls of 4+ score wound against targets with the MONSTER keyword regardless of toughness')
@anti_monster_3 = WeaponAbility.create!(name: 'Anti-Monster 3+', description: 'Wound rolls of 3+ score wound against targets with the MONSTER keyword regardless of toughness')
@anti_vehicle_4 = WeaponAbility.create!(name: 'Anti-Vehicle 4+', description: 'Wound rolls of 4+ score wound against targets with the VEHICLE keyword regardless of toughness')
@anti_vehicle_3 = WeaponAbility.create!(name: 'Anti-Vehicle 3+', description: 'Wound rolls of 3+ score wound against targets with the VEHICLE keyword regardless of toughness')

#weapon to ability associations
## Necron
@weapon_weapon_ability_nigthbringer_strike = WeaponWeaponAbility.create!(weapon: @Scythe_of_the_Nightbringer_strike, weapon_ability: @devastating_wounds)
@weapon_weapon_ability_warscythe = WeaponWeaponAbility.create!(weapon: @warscythe, weapon_ability: @devastating_wounds)

## Dark Angels
@weapon_weapon_ability_fealty_strike = WeaponWeaponAbility.create!(weapon: @fealty_strike, weapon_ability: @lethal_hits)
@weapon_weapon_ability_fealty_sweep = WeaponWeaponAbility.create!(weapon: @fealty_sweep, weapon_ability: @sustained_hits_1)

@weapon_weapon_ability_gw_unforgiven_dev = WeaponWeaponAbility.create!(weapon: @great_weapon_unforgiven, weapon_ability: @devastating_wounds)
@weapon_weapon_ability_gw_unforgiven_sus = WeaponWeaponAbility.create!(weapon: @great_weapon_unforgiven, weapon_ability: @sustained_hits_1)
@weapon_weapon_ability_mace_absolution_monster = WeaponWeaponAbility.create!(weapon: @mace_absolution, weapon_ability: @anti_monster_4)
@weapon_weapon_ability_mace_absolution_vehicle = WeaponWeaponAbility.create!(weapon: @mace_absolution, weapon_ability: @anti_vehicle_4)
@weapon_weapon_ability_relic_weapon_dwk = WeaponWeaponAbility.create!(weapon: @relic_weapon_dwk, weapon_ability: @lethal_hits)

@weapon_weapon_ability_calibanite_gsword_strike = WeaponWeaponAbility.create!(weapon: @calibanite_gsword_strike, weapon_ability: @lethal_hits)
@weapon_weapon_ability_calibanite_gsword_sweep = WeaponWeaponAbility.create!(weapon: @calibanite_gsword_strike, weapon_ability: @sustained_hits_2)

  end
  it "sends a list of factions" do

    get '/api/v1/factions'

    expect(response).to be_successful
    expect(response.status).to eq (200)

    factions = JSON.parse(response.body, symbolize_names: true)

    expect(factions[:data].count).to eq(2)

    factions[:data].each do |faction|
      expect(faction).to have_key(:id)
      expect(faction[:id].to_i).to be_an(Integer)

      expect(faction[:attributes]).to have_key(:name)
      expect(faction[:attributes][:name]).to be_a(String)
    end
  end

  it "can get all units for a given faction ID" do

    get "/api/v1/factions/#{@necrons.id}/units"
    
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

      expect(faction_units[:attributes]).to have_key(:invul_sv)
      if faction_units[:attributes][:invul_sv].nil?
        expect(faction_units[:attributes][:invul_sv]).to be_nil
      else
        expect(faction_units[:attributes][:invul_sv]).to be_a(Integer)
      end

      expect(faction_units[:attributes]).to have_key(:wounds)
      expect(faction_units[:attributes][:wounds]).to be_a(Integer)

      expect(faction_units[:attributes]).to have_key(:leadership)
      expect(faction_units[:attributes][:leadership]).to be_a(Integer)

      expect(faction_units[:attributes]).to have_key(:objective_control)
      expect(faction_units[:attributes][:objective_control]).to be_a(Integer)

      faction_units[:weapons][:data].each do |weapon|
        expect(weapon).to have_key(:id)
        expect(weapon[:id]).to be_a(String)
    
        expect(weapon[:attributes]).to have_key(:name)
        expect(weapon[:attributes][:name]).to be_a(String)
    
        expect(weapon[:attributes]).to have_key(:attacks)
        expect(weapon[:attributes][:attacks]).to be_a(String)
    
        expect(weapon[:attributes]).to have_key(:ws)
        expect(weapon[:attributes][:ws]).to be_a(Integer)
    
        expect(weapon[:attributes]).to have_key(:strength)
        expect(weapon[:attributes][:strength]).to be_a(Integer)

        expect(weapon[:attributes]).to have_key(:ap)
        expect(weapon[:attributes][:ap]).to be_a(Integer)

        expect(weapon[:attributes]).to have_key(:damage)
        expect(weapon[:attributes][:damage]).to be_a(String)

        expect(weapon[:attributes]).to have_key(:range)
        expect(weapon[:attributes][:range]).to be_a(Integer)

        weapon[:abilities][:data].each do |ability|
          expect(ability).to have_key(:id)
          expect(ability[:id]).to be_a(String)
      
          expect(ability[:attributes]).to have_key(:name)
          expect(ability[:attributes][:name]).to be_a(String)
      
          expect(ability[:attributes]).to have_key(:description)
          expect(ability[:attributes][:description]).to be_a(String)
        end
      end
    end
  end

  it "will gracefully handle if a faction id doesn't exist" do
    get "/api/v1/factions/987654321/units"

    expect(response).to_not be_successful
    expect(response.status).to eq(404)

    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data[:errors]).to be_a(Array)
    expect(data[:errors].first[:status]).to eq("404")
    expect(data[:errors].first[:title]).to eq("Couldn't find Faction with 'id'=987654321")
  end
end