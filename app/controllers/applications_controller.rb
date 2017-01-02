class ApplicationsController < ApplicationController
  def create
    if application.save
      redirect_to thanks_applications_path
    else
      render json: application.errors
    end
  end

  private

  helper_method def application
    @application ||= Application.new(application_params)
  end

  def application_params
    params.require(:application).permit(permitted_application_attributes) if params.key?(:application)
  end

  def permitted_application_attributes
    %i(problem solution target_market revenue_streams channels traction funding team other)
  end
end
