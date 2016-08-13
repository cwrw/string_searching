module StringSearching
  class BoyerMooreSearch
    attr_reader :text, :pattern, :occurrences,
      :bad_character_table, :good_suffix_table

    def initialize(pattern, text)
      @text = text
      @pattern = pattern
      @occurrences = []
      @bad_character_table = BadCharacterTable.generate(pattern)
      @good_suffix_table = GoodSuffixTable.generate(pattern)
    end

    def search
      position = 0
      while position < (text.length - pattern.length + 1)
        index = pattern.length - 1
        index -= 1 while index >= 0 && pattern[index] == text[position + index]
        position += calculate_shift(index, position)
      end
      occurrences
    end

    private

    def calculate_shift(index, position)
      if index < 0
        occurrences << position
        good_suffix_table[0]
      else
        character = text[position + index]
        [
          bad_character_lookup(character) - pattern.length + 1 + index,
          good_suffix_table[index + 1]
        ].max
      end
    end

    def bad_character_lookup(character)
      bad_character_table[character] || pattern.length
    end
  end
end
