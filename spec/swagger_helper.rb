# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'www.example.com'
            }
          }
        }
      ],
      components: {
        schemas: {
          request_controls: {
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
                        id: { type: :string },
                        remote_ip: { type: :string },
                        max_request_origin_ip: { type: :integer },
                        destination_path: { type: :string },
                        email: { type: :string },
                        token: { type: :string },
                        acceptance_criteria: { type: :string },
                        period_seconds: { type: :string }
                      }
                    }
                  }
                }
              }
            }
          },
          request_informations: {
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
                        id: { type: :string },
                        client_ip: { type: :string },
                        path: { type: :string },
                        status_code: { type: :string }
                      }
                    }
                  }
                }
              }
            }
          },
          amount_of_status: {
            type: :object,
            properties: { type: :integer },
          },
          amount_of_paths: {
            type: :object,
            properties: { type: :integer },
          },
          amount_of_ips: {
            type: :object,
            properties: { type: :integer },
          },
          errors_raise: {
            type: :object,
            properties: {
              errors: {
                type: :object,
                properties: {
                  status: { type: :integer },
                  title: { type: :string },
                  detail: { type: :string }
                }
              }
            }
          }
        }
      }
    }
  }

  config.swagger_format = :yaml
end

