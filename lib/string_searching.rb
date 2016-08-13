require "pry-byebug"
require "./lib/string_searching/naive_search"
require "./lib/string_searching/boyer_moore_search"
require "./lib/string_searching/bad_character_table"
require "./lib/string_searching/good_suffix_table"
require "benchmark"

module StringSearching
  def self.search # rubocop:disable Metrics/MethodLength
    # text = File.read("./fixtures/shakespeare.text")
    # pattern = "the question"

    text = File.read("./fixtures/star_trek.text").chars
    pattern = "beam up"

    occurrences = []

    search_time = ::Benchmark.realtime do
      occurrences = naive_search(pattern: pattern, text: text)
    end
    puts "---------NAIVE SEARCH---------"
    puts "Time taken = #{search_time}"
    puts "Occurrences = #{occurrences.size}"

    search_time = ::Benchmark.realtime do
      occurrences = boyer_moore_search(pattern: pattern, text: text)
    end
    puts "---------BOYER MOORE SEARCH---------"
    puts "Time taken = #{search_time}"
    puts "Occurrences = #{occurrences.size}"
  end

  def self.naive_search(pattern:, text:)
    StringSearching::NaiveSearch.new(pattern, text).search
  end

  def self.boyer_moore_search(pattern:, text:)
    StringSearching::BoyerMooreSearch.new(pattern, text).search
  end
end

StringSearching.search
