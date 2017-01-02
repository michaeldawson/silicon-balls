class PitchesMailer < ApplicationMailer
  def new_pitch_received(pitch)
    @pitch = pitch
    mail(subject: 'New pitch received')
  end
end
