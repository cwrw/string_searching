module StringSearching
  class BoyerMooreSearch
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
        else
          shift = 1
        end

        position += shift
      end

      occurrences
    end

    private

    def pattern_match?(pattern, position)
      for index in (pattern.length - 1).downto(0) do
        return false unless pattern[index] == text[position + index]
      end
    end
  end
end
