require 'spec_helper'

module Galaxy
  module Invaders
    RSpec.describe 'Radar' do
      describe '.window_width / .window_height' do
        let(:radar) { Radar.new }

        it 'should return min width/height of window to search for enemy pattern' do
          expect(Galaxy::Invaders).to receive(:patterns).twice do
            [
              ['123', '123', '123'],
              ['12', '34'],
              ['12345']
            ]
          end
          expect(radar.window_width).to eq(2)
          expect(radar.window_height).to eq(1)
        end
      end

      describe '.lookup_enemies' do
        let(:radar) { Radar.new }

        before do
          classifier = double(
            'classifier', classify: Galaxy::Invaders::ENEMY_CLASS)
          allow(radar).to receive(:classifier) { classifier }
        end

        context 'with radar sample 1' do
          let(:enemies) { radar.lookup_enemies(sample) }

          let(:sample) do
            %q(
--o-----o--
---o---o---
--ooooooo--
-oo-ooo-oo-
ooooooooooo
o-ooooooo-o
o-o-----o-o
---oo-oo---
            )
          end

          it 'should find approximate locations of enemies' do
            expect(enemies.size).to eq(1)
          end

          it 'should respond with 4 coordinates to choose area to destroy' do
            expect(enemies.size).to eq(1)

            enemy = enemies[0]

            # top-left
            expect(enemy.area[0].x).to eq(0)
            expect(enemy.area[0].y).to eq(0)

            # bottom-left
            expect(enemy.area[1].x).to eq(0)
            expect(enemy.area[1].y).to eq(7)

            # top-right
            expect(enemy.area[2].x).to eq(7)
            expect(enemy.area[2].y).to eq(0)

            # bottom-right
            expect(enemy.area[3].x).to eq(7)
            expect(enemy.area[3].y).to eq(7)
          end # it
        end # context

        context 'with radar sample 2' do
          let(:enemies) { radar.lookup_enemies(sample) }

          let(:sample) do
            %q(
---oo-----o-----o--
--oooo-----o---o---
-oooooo---ooooooo--
oo-oo-oo-oo-ooo-oo-
ooooooooooooooooooo
--o--o--o-ooooooo-o
-o-oo-o-o-o-----o-o
o-o--o-o---oo-oo---
            )
          end

          it 'should find approximate locations of enemies' do
            expect(enemies.size).to eq(2)
          end

          it 'should respond with 4 coordinates to choose area to destroy' do
            expect(enemies.size).to eq(2)

            enemy = enemies[0]
            expect(enemy.area[0]).to eq(Vector2.new(0, 0))
            expect(enemy.area[1]).to eq(Vector2.new(0, 7))
            expect(enemy.area[2]).to eq(Vector2.new(7, 0))
            expect(enemy.area[3]).to eq(Vector2.new(7, 7))

            enemy = enemies[1]
            expect(enemy.area[0]).to eq(Vector2.new(0, 7))
            expect(enemy.area[1]).to eq(Vector2.new(0, 14))
            expect(enemy.area[2]).to eq(Vector2.new(7, 0))
            expect(enemy.area[3]).to eq(Vector2.new(7, 14))
          end # it
        end # context
      end # describe
    end
  end
end

