require 'swagger_helper'

describe 'List of request_controls' do
  path '/api/v1/request_controls' do
    get 'Return list of request controls' do
      tags 'API::V1::ApiProxy::RequestControl'
      consumes 'application/json'
      produces 'application/json'
      response '200', 'retrieve the request controls' do
        schema '$ref' => '#/components/schemas/request_controls'
        let!(:request_controls) do
          create(:request_control)
          create(:request_control)
          create(:request_control)
        end
        run_test!
      end
    end
  end
end
