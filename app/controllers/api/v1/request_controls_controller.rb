module Api
  module V1
    class RequestControlsController < Api::V1::ApplicationController

      before_action :set_request_control, only: %i[update]

      def index
        request_controls = RequestControl.all
        render json: RequestControlSerializer.new(request_controls), status: :ok
      end

      def create
        request_control = RequestControl.create!(request_control_params)
        render json: RequestControlSerializer.new(request_control), status: :created
      end

      def update
        @request_control.update!(request_control_params)
        render json: RequestControlSerializer.new(@request_control).serializable_hash, status: :ok
      end

      private

      def request_control_params
        params
          .require(:request_control)
          .permit(:remote_ip, :max_request_origin_ip, :destination_path, :email, :token, :acceptance_criteria)
      end

      def set_request_control
        @request_control = RequestControl.find(params[:id])
      end
    end
  end
end
