require 'classifier-reborn'

module Galaxy
  module Invaders
    ENEMY_PATTERN_1 = %q{
--o-----o--
---o---o---
--ooooooo--
-oo-ooo-oo-
ooooooooooo
o-ooooooo-o
o-o-----o-o
---oo-oo---
    }
    ENEMY_PATTERN_2 = %q{
---oo---
--oooo--
-oooooo-
oo-oo-oo
oooooooo
--o--o--
-o-oo-o-
o-o--o-o
    }

    def self.patterns
      [
        Helpers.prepare_sample(ENEMY_PATTERN_1),
        Helpers.prepare_sample(ENEMY_PATTERN_2)
      ]
    end

    class ClassifierBuilder
      def self.build
        classifier = ClassifierReborn::Bayes.new(:enemy, :not_enemy)
        classifier.train(:enemy, ENEMY_PATTERN_1)
        classifier.train(:enemy, ENEMY_PATTERN_2)

        # let's put some examples that's definitely our enemies,
        # it could be noise.
        classifier.train :not_enemy,
          %q{
-o-----oo----
-o--------o--
------------o
-------------
------------o
---o-o-------
          }
        classifier.train :not_enemy,
          %q{
o--------o--o--
---------------
---o--o-oo--o--
oo-----o----o--
--------o--o---
-o--------o-o--
          }

        classifier
      end
    end
  end
end
