class PitchesMailer < ApplicationMailer
  def new_pitch_received(pitch, pdf_file_path)
    @pitch = pitch
    mail(subject: 'New pitch received')
    file_name = "#{pitch.company_name}.pdf"
    mail.attachments[file_name] = File.read(pdf_file_path)
  end
end
