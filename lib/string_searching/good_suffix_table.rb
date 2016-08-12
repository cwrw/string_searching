module StringSearching
  class GoodSuffixTable
    attr_reader :pattern, :length, :border, :shift
    def self.generate_table_one(pattern)
      new(pattern).generate_table_one
    end

    def initialize(pattern)
      @pattern = pattern
      @length = pattern.length
      @border = {}
      @shift = Hash.new(0)
    end

    def generate_table_one
      index = length
      border_occurence = length + 1
      border[index] = border_occurence
      while index > 0
        border_occurence = reset_border_if_mismatch!(border_occurence, index) - 1
        index -= 1
        shift[index] = 0
        border[index] = border_occurence
      end
      shift
    end

    private

    def reset_border_if_mismatch!(border_occurence, index) # rubocop:disable Metrics/AbcSize
      while border_occurence <= length && pattern[index - 1] != pattern[border_occurence - 1]
        shift[border_occurence] = border_occurence - index if shift[border_occurence].zero?
        border_occurence = border[border_occurence]
      end

      border_occurence
    end
  end
end
