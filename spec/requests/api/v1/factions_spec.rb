require 'swagger_helper'

RSpec.describe 'api/factions', type: :request do

  path '/api/v1/factions' do

    get('list factions') do
      tags 'Factions'
      consumes 'application/json'
      produces 'application/json'
      description "List all factions in the system"

      response(200, 'successful') do
        schema type: :hash, items: { "$ref" => "#/components/schema/faction" }

        let!(:faction1) { Faction.create(name: "Necrons") }
        let!(:faction2) { Faction.create(name: "Dark Angels") }

        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            "application/json"=>{
              examples: {
                test_example: {
                  value: JSON.parse(response.body, symbolize_names: true)
                }
              }
            }
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end

        run_test!
      end
    end
  end

  path '/api/v1/factions/{id}/units' do
    parameter name: 'id', in: :path, type: :integer, description: 'The ID for the Faction'
    

    get('show faction') do
      description "Get the details for a particular faction"

      produces 'application/json'

      response(200, 'successful') do
        schema "$ref" => "#/components/schemas/factionWithUnits"

        let(:faction) { Faction.create(name: "Necrons") }
        let(:id) { faction.id }
        let!(:unit1) { 
          Unit.create!(
            name: 'Orikan the Diviner', 
            faction: faction,
            attributes: {
              "name": "Orikan the Diviner",
              "movement": 5,
              "toughness": 4,
              "sv": 4,
              "invul_sv": 4,
              "wounds": 4,
              "leadership": 6,
              "objective_control": 1
            }
          ).tap do |unit|
            unit.weapons.create!(
              name: "Staff of Tomorrow",
              attacks: "2",
              ws: 3,
              strength: 4,
              ap: 3,
              damage: "D3",
              range: 0,
              weapon_abilities_attributes: [
                {
                  name: "Devastating Wounds",
                  description: "Refer to game rules"
                }
              ]
            )
          end
        }
        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            "application/json"=>{
              examples: {
                test_example: {
                  value: JSON.parse(response.body, symbolize_names: true)
                }
              }
            }
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end

        run_test!
      end

      response(404, 'faction not found') do
        schema "$ref" => "#/components/schemas/not_found"
        
        let(:id) { '655555553' }  # or any ID that doesn't exist
        
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['message']).to eq('Faction not found')
        end
      end
    end
  end
end
