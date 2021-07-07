module Api
  module V1
    class RequestInformationsController < Api::V1::ApplicationController

      def amount_of_status
        amount_status = RequestInformation.amount_of_status(params[:status])
        render json: { request_information: { amount_of_status: amount_status } }, status: :ok
      end

      def amount_of_paths
        amount_paths = RequestInformation.amount_of_paths(params[:path])
        render json: { request_information: { amount_of_paths: amount_paths } }, status: :ok
      end

      def amount_of_ips
        amount_ips = RequestInformation.amount_of_ips(params[:client_ip])
        render json: { request_information: { amount_of_ips: amount_ips } }, status: :ok
      end

      private

      def request_information_params
        params
          .require(:request_information)
          .permit(:client_ip, :status, :path)
      end
    end
  end
end
