module Api
  module V1
    class PhotosController < Api::V1::ApplicationController
      def show
        # $count = 0
        head :ok
        # $count = $count + 1
        # Rails.logger.info($count)
      end
    end
  end
end
