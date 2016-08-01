module StringSearching
  class NaiveSearch
    attr_reader :text, :pattern, :occurrences
    def initialize(pattern, text)
      @text = text
      @pattern = pattern
      @occurrences = []
    end

    def search
      position = 0
      while position < (text.length - pattern.length + 1)
        shift = 1
        if pattern_match?(pattern, position)
          shift = pattern.length + 1
          occurrences << position
        end

        position += shift
      end

      occurrences
    end

    private

    def pattern_match?(pattern, position)
      pattern.each_char.with_index do |_, index|
        return false unless pattern[index] == text[position + index]
      end
    end
  end
end
