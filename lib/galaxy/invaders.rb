module Galaxy
  module Invaders
    require_relative 'invaders/vector2'
    require_relative 'invaders/helpers'
    require_relative 'invaders/classifier_builder'
    require_relative 'invaders/enemy'
    require_relative 'invaders/radar'

    class Error < StandardError; end
  end
end
