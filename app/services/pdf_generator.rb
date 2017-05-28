class PDFGenerator
  def initialize(partial, **locals)
    @partial = partial
    @locals = locals
  end

  def generate
    File.open(tempfile.path, 'wb') do |file|
      file << pdf
    end
  end

  private

  attr_reader :partial, :locals

  def tempfile
    @tempfile ||= Tempfile.new(['silicon-balls', 'pdf'])
  end

  def pdf
    WickedPdf.new.pdf_from_string(
      ApplicationController.render(
        partial,
        layout: 'pdf',
        locals: locals
      )
    )
  end
end
