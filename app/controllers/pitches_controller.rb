class PitchesController < ApplicationController
  def create
    if pitch.save && pitch.send_email
      redirect_to thanks_pitches_path
    else
      render json: pitch.errors
    end
  end

  private

  helper_method def pitch
    @pitch ||= Pitch.new(pitch_params)
  end

  def pitch_params
    params.require(:pitch).permit(permitted_pitch_attributes) if params.key?(:pitch)
  end

  def permitted_pitch_attributes
    %i(problem solution target_market revenue_streams channels traction funding team other)
  end
end
