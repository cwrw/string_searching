module StringSearching
  class BoyerMooreSearch
    attr_reader :text, :pattern, :occurrences, :bad_character_table

    def initialize(pattern, text)
      @text = text
      @pattern = pattern
      @occurrences = []
      @bad_character_table = BadCharacterTable.generate(pattern)
      #@good_suffix_table = GoodSuffixTable.generate(pattern)
    end

    def search
      position = 0
      while position < (text.length - pattern.length + 1)
        shift = 1
        mismatch = false

        for index in (pattern.length - 1).downto(0) do
          character = text[position + index]
          unless pattern[index] == character
            mismatch = true
            shift = [bad_character_lookup(character)].max
            break
          end
        end

        unless mismatch
          shift = pattern.length
          occurrences << position
        end

        position += shift
      end

      occurrences
    end

    def bad_character_lookup(character)
      bad_character_table[character] || pattern.length
    end
  end
end
