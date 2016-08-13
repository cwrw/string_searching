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
      generate_table_one
      generate_table_two
      shift
    end

    private

    def generate_table_one
      index = length
      border_occurrence = length + 1
      border[index] = border_occurrence
      while index > 0
        border_occurrence = reset_border_if_mismatch!(border_occurrence, index)
        index -= 1
        shift[index] = 0
        border[index] = border_occurrence
      end
    end

    def reset_border_if_mismatch!(border_occurrence, index)
      while border_occurrence <= length && pattern[index - 1] != pattern[border_occurrence - 1]
        shift[border_occurrence] = border_occurrence - index if shift[border_occurrence].zero?
        border_occurrence = border[border_occurrence]
      end

      border_occurrence - 1
    end

    def generate_table_two
      border_occurrence = border[0]
      (0..length).each do |index|
        shift[index] = border_occurrence if shift[index].zero?
        border_occurrence = border[border_occurrence] if border_occurrence == index
      end
    end
  end
end
