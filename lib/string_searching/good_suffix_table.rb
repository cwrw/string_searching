module StringSearching
  class GoodSuffixTable
    attr_reader :pattern, :length
    def self.generate(pattern)
      new(pattern).generate
    end

    def initialize(pattern)
      @pattern = pattern
      @length = pattern.length
    end

    def generate
      i = length
      j = length + 1
      border = {}
      border[i] = j
      while i > 0
        while j <= length && pattern[i - 1] != pattern[j - 1]
          j = border[j]
        end
        i = i - 1
        j = j - 1
        border[i] = j
      end
      border
    end
  end
end
