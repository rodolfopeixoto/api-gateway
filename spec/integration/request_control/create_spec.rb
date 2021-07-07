require 'swagger_helper'

describe 'Create Request Control' do
  path '/api/v1/request_controls' do
    post 'Create an Request Control' do
      tags 'API::V1::ApiProxy::RequestControl'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :body,
                in: :body,
                required: true,
                description: 'It body for create an request control',
                schema: {
                  type: :object,
                  properties: {
                    request_control: {
                      type: :object,
                      properties: {
                        remote_ip: { type: :string },
                        max_request_origin_ip: { type: :integer },
                        destination_path: { type: :string },
                        email: { type: :string },
                        token: { type: :string },
                        acceptance_criteria: { type: :string }
                      }
                    }
                  }
                }
      response '201', 'it create request control' do
        schema type: :object,
               properties: {
                 data: {
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
                        acceptance_criteria: { type: :string }
                       }
                     }
                   }
                 }
               }
        let!(:request_control) { attributes_for(:request_control) }
        let!(:body) do
              request_control
        end
        run_test!
      end
    end
  end
end
