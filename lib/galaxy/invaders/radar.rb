module Galaxy
  module Invaders
    class Radar
      def classifier
        @classifier ||= ClassifierBuilder.build
      end

      def enemy?(window_entry)
        classified = classifier.classify(Helpers.stringify(window_entry))
        classified == 'enemy'
      end

      def lookup_enemies(sample)
        sample = Helpers.prepare_sample(sample)

        if sample.size < window_height
          if enemy?(sample)
            enemy = Enemy.new(
              0, 0,
              0, sample[0].length,
              sample.size, 0,
              sample.size, sample[0].length
            )
            return [enemy]
          end
        end

        if sample[0].length < window_width
          if enemy?(sample)
            enemy = Enemy.new(
              0, 0,
              0, sample[0].length,
              sample.size, 0,
              sample.size, sample[0].length
            )
            return [enemy]
          end
        end

        enemies = []
        i = 0
        while i <= (sample.size - window_height)
          j = 0
          found = false
          while j <= sample[0].length - window_width
            window_entry = sample[i...i + window_height].map do |row|
              row[j...j + window_width]
            end

            if enemy?(window_entry)
              found = true

              enemy = Enemy.new(
                i, j,
                i, j + window_width - 1,
                i + window_height - 1, 0,
                i + window_height - 1, j + window_width - 1
              )

              j += window_height - 1

              enemies << enemy
            else
              j += 1
            end # if
          end # while

          if found
            i += window_width - 1
          else
            i += 1
          end
        end # while

        enemies
      end

      def window_width
        @window_width ||= Galaxy::Invaders.patterns.map(&:first).map(&:size).min
      end

      def window_height
        @window_height ||= Galaxy::Invaders.patterns.map(&:size).min
      end
    end
  end
end
