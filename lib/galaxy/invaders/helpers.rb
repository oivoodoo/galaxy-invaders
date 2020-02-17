module Galaxy
  module Invaders
    module Helpers
      def self.normalize(sample)
        sample
          .split("\n")
          .map(&:strip)
          .select { |line| !line.nil? && line != '' }
          .map { |row| row.chars.map { |v| v == 'o' ? 1 : 0 } }
      end
    end
  end
end
