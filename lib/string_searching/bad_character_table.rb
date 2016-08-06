module StringSearching
  class BadCharacterTable
    attr_reader :pattern, :length
    def self.generate(pattern)
      new(pattern).generate
    end

    def initialize(pattern)
      @pattern = pattern
      @length = pattern.length
    end

    def generate
      pattern.each_char.with_index.with_object({}) do |(char, index), table|
        index == length - 1 ? table[char] ||= length : table[char] = [length - index - 1, 1].max
      end
    end
  end
end
