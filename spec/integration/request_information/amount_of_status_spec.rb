require 'swagger_helper'

describe 'Amount of status' do
  path '/api/v1/amount_of_status' do
    get 'Return list of request controls' do
      tags 'API::V1::ApiProxy::RequestInformation'
      consumes 'application/json'
      produces 'application/json'
      response '200', 'retrieve the request information' do
        schema '$ref' => '#/components/schemas/amount_of_status'
        let!(:request_informations) do
          create(:request_information)
          create(:request_information)
          create(:request_information)
        end
        run_test!
      end
    end
  end
end
