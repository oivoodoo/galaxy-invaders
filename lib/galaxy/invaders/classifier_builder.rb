require 'libsvm'

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
    OK_PATTERN_1 = %q{
-o-----oo----
-o--------o--
------------o
-------------
------------o
---o-o-------
}
    OK_PATTERN_2 = %q{
-------------
-------------
-------------
-------------
-------------
-------------
}
    OK_PATTERN_3 = %q{
ooooooooooooo
ooooooooooooo
ooooooooooooo
ooooooooooooo
ooooooooooooo
ooooooooooooo
}
    OK_PATTERN_4 = %q{
o-o-o-o-o-o-o
-------------
o-o-o-o-o-o-o
-------------
o-o-o-o-o-o-o
-------------
}

    def self.patterns
      [
        Helpers.prepare_sample(ENEMY_PATTERN_1),
        Helpers.prepare_sample(ENEMY_PATTERN_2)
      ]
    end

    NOT_ENEMY_CLASS = 0
    ENEMY_CLASS = 1

    Classifier = Struct.new(:model) do
      def classify(data)
        model.predict(Libsvm::Node.features(data.flatten)).to_i
      end
    end

    class ClassifierBuilder
      def self.build
        problem = Libsvm::Problem.new
        parameter = Libsvm::SvmParameter.new

        parameter.cache_size = 1 # in megabytes
        parameter.eps = 0.001
        parameter.c = 10

        examples = [
          Helpers.prepare_sample(ENEMY_PATTERN_1),
          Helpers.prepare_sample(ENEMY_PATTERN_2),
          Helpers.prepare_sample(OK_PATTERN_1),
          Helpers.prepare_sample(OK_PATTERN_2),
          Helpers.prepare_sample(OK_PATTERN_3),
          Helpers.prepare_sample(OK_PATTERN_4)
        ].map { |ary| Libsvm::Node.features(ary.flatten) }
        labels = [
          ENEMY_CLASS,
          ENEMY_CLASS,
          NOT_ENEMY_CLASS,
          NOT_ENEMY_CLASS,
          NOT_ENEMY_CLASS,
          NOT_ENEMY_CLASS
        ]

        problem.set_examples(labels, examples)

        model = Libsvm::Model.train(problem, parameter)

        classifier = Classifier.new(model)
        classifier
      end
    end
  end
end
