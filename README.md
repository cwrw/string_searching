# String Searching

Searching text for the occurrence of a pattern using both Naive Search and the Boyer Moore Search.

### Naive search
The Naive search compares a character in the text with a character in the pattern from left to right, if theres a mismatch it always shifts the pattern to the left by one.

### Boyer Moore Search
The Boyer Moore algorithm compares the pattern characters with text characters from right to left, but shifts the pattern from left to right if a mismatch occurs.

To maximise a shift, the pre-computation of two tables is necessary

1- Bad Character Table
  - Calculates a shift for a character mismatch if that character occurs somewhere else in the pattern, allowing it to align with the text.

2- Good Suffix Table
  - Calculates a shift for a suffix after a mismatch if that suffix occurs somewhere else in the pattern, allowing it to align with the text.

  - Calculates a shift for the suffix after a mismatch if part of that suffix occurs as a prefix in the pattern, allowing it to align with the text.

After preprocessing both tables, if a mismatch occurs when comparing the text with the pattern, we choose the maximum shift occurring from both tables

To run a benchmark on the fixtures provided:

    ruby lib/string_searching.rb

Reference for [Boyer Moore](http://www.inf.fh-flensburg.de/lang/algorithmen/pattern/bmen.htm)

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cwrw/string_searching. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The system is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
