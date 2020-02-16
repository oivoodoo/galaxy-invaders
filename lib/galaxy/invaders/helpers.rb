module Galaxy
  module Invaders
    module Helpers

      def self.prepare_sample(sample)
        sample
          .split("\n")
          .map(&:strip)
          .select { |line| !line.nil? && line != '' }
      end

      def self.stringify(array)
        array.join("\n")
      end
    end
  end
end
