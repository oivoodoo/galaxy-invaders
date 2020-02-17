require 'spec_helper'

module Galaxy
  module Invaders
    RSpec.describe 'Radar integration' do
      describe 'radar on using classifier_builder' do
        let(:radar) { Radar.new }

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
            enemy = enemies[0]
            expect(enemy.area[0]).to eq(Vector2.new(0, 1))
            expect(enemy.area[1]).to eq(Vector2.new(0, 8))
            expect(enemy.area[2]).to eq(Vector2.new(7, 0))
            expect(enemy.area[3]).to eq(Vector2.new(7, 8))
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

