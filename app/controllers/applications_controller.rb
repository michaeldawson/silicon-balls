class ApplicationsController < ApplicationController
  private

  helper_method def application
    @application ||= Application.new(application_params)
  end

  def application_params
    params.require(:application).permit(permitted_application_attributes) if params.key?(:application)
  end

  def permitted_application_attributes
    %i(team problem solution uvp segments metrics channels cost_structure revenue_streams funding funding_purpose funding_equity)
  end
end
