module Api
  module V1
    class RequestControlsController < Api::V1::ApplicationController
      def create
        request_control = RequestControl.create!(request_control_params)
        render json: RequestControlSerializer.new(request_control), status: :created
      end

      private

      def request_control_params
        params
          .require(:request_control)
          .permit(:remote_ip, :max_request_origin_ip, :destination_path, :email, :token, :acceptance_criteria)
      end
    end
  end
end
