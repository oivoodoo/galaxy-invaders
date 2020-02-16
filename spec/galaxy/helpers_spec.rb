module Galaxy
  module Invaders

    RSpec.describe Helpers do
      subject { Galaxy::Invaders::Helpers }

      describe '.stringify' do
        it 'should make from array multiline sample for classifier' do
          expect(subject.stringify(['1','2'])).to eq("1\n2")
        end
      end

      describe '.prepare_sample' do
        it 'should clean up empty lines from the sample and make array from multline string' do
          expect(subject.prepare_sample("\n1\n2\n")).to eq(['1', '2'])
        end
      end
    end
  end
end
