require 'rails_helper'

RSpec.describe PDFGenerator do
  let(:pdf_generator) { described_class.new(partial, **locals) }

  describe '#generate' do
    context 'with a valid partial and pitch passed in' do
      let(:partial) { 'pdf/pitch' }
      let(:pitch) { FactoryGirl.create(:pitch) }
      let(:locals) { { pitch: pitch } }

      it 'generats a PDF' do
        file_path = pdf_generator.generate
        # smoke test
        File.open(file_path).read
      end
    end
  end
end
