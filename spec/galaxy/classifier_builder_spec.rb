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
          expect(instance.classify(Galaxy::Invaders::ENEMY_PATTERN_1)).to eq('enemy')

          not_enemy_sample = %q{
---------------
---------------
---------------
---------------
---------------
---------------
          }
          expect(instance.classify(not_enemy_sample)).to eq('not_enemy')
        end
      end
    end
  end
end

