# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under openapi_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a openapi_spec tag to the
  # the root example_group in your specs, e.g. describe '...', openapi_spec: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      components: {
        schemas: {
          not_found: {
            type: 'object',
            properties: {
              message: { type: :string }
            }
          },
          faction: {    # << This is where we describe our model
            type: 'faction',
            required: [:name],
            properties: {
              name: {
                type: :string,
                example: "Necrons"
              },
            }
          },
          factionWithUnits: {
            type: :object,
            properties: {
              data: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    id: { type: :string },
                    type: { type: :string },
                    attributes: {
                      type: :object,
                      properties: {
                        name: { type: :string },
                        movement: { type: :integer },
                        toughness: { type: :integer },
                        sv: { type: :integer },
                        invul_sv: { type: :integer },
                        wounds: { type: :integer },
                        leadership: { type: :integer },
                        objective_control: { type: :integer },
                        faction_id: { type: :integer }
                      }
                    },
                    weapons: {
                      type: :object,
                      properties: {
                        data: {
                          type: :array,
                          items: {
                            type: :object,
                            properties: {
                              id: { type: :string },
                              type: { type: :string },
                              attributes: {
                                type: :object,
                                properties: {
                                  name: { type: :string },
                                  attacks: { type: :string },
                                  ws: { type: :integer },
                                  strength: { type: :integer },
                                  ap: { type: :integer },
                                  damage: { type: :string },
                                  range: { type: :integer }
                                }
                              },
                              abilities: {
                                type: :object,
                                properties: {
                                  data: {
                                    type: :array,
                                    items: {
                                      type: :object,
                                      properties: {
                                        id: { type: :string },
                                        type: { type: :string },
                                        attributes: {
                                          type: :object,
                                          properties: {
                                            name: { type: :string },
                                            description: { type: :string }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
      },
      servers: [
        {
          url: 'https://wh40k-battlegrounds-be-ce09c759206c.herokuapp.com/',
          variables: {
            defaultHost: {
              default: 'www.heroku.com'
            }
          }
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The openapi_specs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml
end
