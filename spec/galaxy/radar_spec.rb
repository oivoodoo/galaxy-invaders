require 'spec_helper'

module Galaxy
  module Invaders
    RSpec.describe 'Radar' do
      subject { enemies = Radar.lookup_enemies(sample) }

      describe '.lookup_enemies' do
        context 'with radar sample' do
          let(:sample) do
            %q{
    --o-----o--
    ---o---o---
    --ooooooo--
    -oo-ooo-oo-
    ooooooooooo
    o-ooooooo-o
    o-o-----o-o
    ---oo-oo---
            }
          end

          it 'should find approximate locations of enemies' do
            expect(subject.size).to eq(1)
          end

          it 'should respond with 4 coordinates to choose area to destroy' do
            enemy = subject[0]

            # top-left
            expect(enemy.area[0].x).to eq(0)
            expect(enemy.area[0].y).to eq(0)

            # bottom-left
            expect(enemy.area[1].x).to eq(0)
            expect(enemy.area[1].y).to eq(7)

            # top-right
            expect(enemy.area[2].x).to eq(10)
            expect(enemy.area[2].y).to eq(0)

            # bottom-right
            expect(enemy.area[3].x).to eq(10)
            expect(enemy.area[3].y).to eq(7)
          end
        end
      end
    end
  end
end
