require 'swagger_helper'

describe 'The request control update' do
  path '/api/v1/request_controls/{id}' do
    put 'Return the request_controls update' do
      tags 'API::V1::ApiProxy::RequestControl'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id,
                in: :path,
                type: :string
      parameter name: :body,
                in: :body,
                required: true,
                description: 'It body for update an request_control',
                schema: {
                  type: :object,
                  properties: {
                    request_control: {
                      type: :object,
                      properties: {
                        remote_ip: { type: :string },
                        max_request: { type: :integer },
                        destination_path: { type: :string },
                        email: { type: :string },
                        token: { type: :string },
                        acceptance_criteria: { type: :string }
                      }
                    }
                  }
                }

      response '200', 'retrieve the update request control' do
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
                        max_request: { type: :integer },
                        destination_path: { type: :string },
                        email: { type: :string },
                        token: { type: :string },
                        acceptance_criteria: { type: :string }
                       }
                     }
                   }
                 }
               }
        let!(:id) do
          request_control = create(:request_control)
          request_control.id
        end
        let!(:body) do
          {
            request_control: {
              email: 'sandro@moreira.com'
            }
          }
        end
        run_test!
      end

      response '404', 'retrieve the error not found' do
        schema '$ref' => '#/components/schemas/errors_raise'
        let!(:id) do
          '24242141241'
        end
        let!(:body) do
          {
            request_control: {
              email: 'sandro@moreira.com'
            }
          }
        end
        run_test!
      end
    end
  end
end
