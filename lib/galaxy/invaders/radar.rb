module Galaxy
  module Invaders

    class Radar
      def self.lookup_enemies(_)
        [
          Enemy.new(
            0, 0,
            0, 7,
            10, 0,
            10, 7
          )
        ]
      end
    end
  end
end
