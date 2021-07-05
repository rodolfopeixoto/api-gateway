module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |error|
      render json: json_response_exception_handle(error, 404,  error.model), status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |error|
      render json: json_response_exception_handle(error, 422,  error.model), status: :unprocessable_entity
    end
  end

  def json_response_errors(message, status, title)
    {
      errors: {
        status: status,
        title: title,
        detail: message
      }
    }
  end

  private

  def four_twenty_two(error)
    render json: json_response_exception_handle(error, 422,  error.model), status: :unprocessable_entity
  end

  def json_response_exception_handle(error, status, title)
    {
      errors: {
        status: status,
        title: title,
        detail: error.message
      }
    }
  end
end
