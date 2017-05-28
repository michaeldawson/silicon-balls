class SendPitchEmail
  def initialize(pitch)
    @pitch = pitch
  end

  def perform
    pdf_generator = PDFGenerator.new('pdf/pitch', pitch: pitch)
    pdf_file = pdf_generator.generate
    PitchesMailer.new_pitch_received(pitch, pdf_file.path).deliver_now
  end

  private

  attr_reader :pitch
end
