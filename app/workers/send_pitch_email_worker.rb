class SendPitchEmailWorker
  include Sidekiq::Worker

  def perform(pitch_id)
    pitch = Pitch.find(pitch_id)
    SendPitchEmail.new(pitch).perform
  end
end
