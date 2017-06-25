class PitchesController < ApplicationController
  def create
    if pitch.save
      SendPitchEmailWorker.perform_async(pitch.id)
      redirect_to thanks_pitches_path
    else
      render json: { success: false, errors: pitch.errors }
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
    %i(
      company_name problem current_solutions solution target_market channels revenue_streams competitive_advantage team
      founders competitive_advantage traction obstacles funding other contact_details
    )
  end
end
