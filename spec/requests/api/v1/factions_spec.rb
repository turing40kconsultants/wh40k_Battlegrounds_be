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

  # path '/api/v1/factions/{id}/units' do
  #   parameter name: 'id', in: :path, type: :integer, description: 'The ID for the Faction'

  #   get('show order') do
  #     description "Get the details for a particular faction"

  #     produces 'application/json'

  #     response(200, 'successful') do
  #       schema "$ref" => "#/components/schemas/faction"

  #       let(:faction) { Faction.create(name: "Necrons") }
  #       let(:id) { faction.id }

  #       after do |example|
  #         content = example.metadata[:response][:content] || {}
  #         example_spec = {
  #           "application/json"=>{
  #             examples: {
  #               test_example: {
  #                 value: JSON.parse(response.body, symbolize_names: true)
  #               }
  #             }
  #           }
  #         }
  #         example.metadata[:response][:content] = content.deep_merge(example_spec)
  #       end

  #       run_test!
  #     end
  #   end
  # end
end
