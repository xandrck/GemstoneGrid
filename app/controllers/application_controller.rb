class ApplicationController < ActionController::API
  rescue_from StandardError do
    render json: { errors: I18n.t('errors.default') }, status: :internal_server_error
  end

  rescue_from ActionController::ParameterMissing do |error|
    render json: { errors: error.message }, status: :internal_server_error
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: I18n.t('errors.default') }, status: :not_found
  end
end
