require 'swagger_helper'

describe 'Amount of many requests' do
  path '/api/v1/amount_of_many_requests' do
    get 'Return list of amount of many requests' do
      tags 'API::V1::ApiProxy::RequestInformation'
      consumes 'application/json'
      produces 'application/json'
      response '200', 'retrieve the request information' do
        schema '$ref' => '#/components/schemas/amount_of_many_requests'
        let!(:request_informations) do
          create(:request_information, status_code: '429')
          create(:request_information)
          create(:request_information)
        end
        run_test!
      end
    end
  end
end
