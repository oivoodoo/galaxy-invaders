module Galaxy
  module Invaders
    RSpec.describe Helpers do
      subject { Galaxy::Invaders::Helpers }

      describe '.prepare_sample' do
        it 'should clean up empty lines from the sample and make array from multline string' do
          expect(subject.prepare_sample("\no\n-\n")).to eq([[1], [0]])
        end
      end
    end
  end
end
