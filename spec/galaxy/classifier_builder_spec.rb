require 'spec_helper'

module Galaxy
  module Invaders
    RSpec.describe 'ClassifierBuilder' do
      describe '.build' do
        let(:instance) { ClassifierBuilder.build }

        it 'should respond_to :classify method' do
          expect(instance.respond_to?(:classify)).to eq(true)
        end

        it 'should return enemy or not_enemy' do
          sample = Helpers.prepare_sample(Galaxy::Invaders::ENEMY_PATTERN_1)
          expect(instance.classify(sample)).to eq(1)

          not_enemy_sample = %q{
---------------
---------------
---------------
---------------
---------------
---------------
          }
          sample = Helpers.prepare_sample(not_enemy_sample)
          expect(instance.classify(sample)).to eq(0)
        end
      end
    end
  end
end

