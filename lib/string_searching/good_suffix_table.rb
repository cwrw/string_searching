module StringSearching
  class GoodSuffixTable
    attr_reader :pattern, :length, :border, :shift
    def self.generate(pattern)
      new(pattern).generate
    end

    def initialize(pattern)
      @pattern = pattern
      @length = pattern.length
      @border = {}
      @shift = Hash.new(0)
    end

    def generate
      i = length
      j = length + 1
      border[i] = j
      while i > 0
        while j <= length && pattern[i - 1] != pattern[j - 1]
          shift[j] = j - i if shift[j] == 0
          j = border[j]
        end
        i = i - 1
        j = j - 1
        shift[i] = 0
        border[i] = j
      end
      shift
    end
  end
end
