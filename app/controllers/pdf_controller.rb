class PdfController < ApplicationController
  layout 'pdf'

  helper_method def pitch
    Pitch.last
  end
end
