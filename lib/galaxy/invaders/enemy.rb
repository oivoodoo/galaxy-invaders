module Galaxy
  module Invaders
    Enemy = Struct.new(
      :x0, :y0,
      :x1, :y1,
      :x2, :y2,
      :x3, :y3
    ) do
      def area
        @area ||=
          [
            Vector2.new(x0, y0),
            Vector2.new(x1, y1),
            Vector2.new(x2, y2),
            Vector2.new(x3, y3)
          ]
      end
    end
  end
end
