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
      border_occurence = length + 1
      border[index] = border_occurence
      while index > 0
        border_occurence = reset_border_if_mismatch!(border_occurence, index)
        index -= 1
        shift[index] = 0
        border[index] = border_occurence
      end
    end

    def reset_border_if_mismatch!(border_occurence, index) # rubocop:disable Metrics/AbcSize
      while border_occurence <= length && pattern[index - 1] != pattern[border_occurence - 1]
        shift[border_occurence] = border_occurence - index if shift[border_occurence].zero?
        border_occurence = border[border_occurence]
      end

      border_occurence - 1
    end

    def generate_table_two
      border_occurence = border[0]
      (0..length).each do |index|
        shift[index] = border_occurence if shift[index].zero?
        border_occurence = border[border_occurence] if border_occurence == index
      end
    end
  end
end
