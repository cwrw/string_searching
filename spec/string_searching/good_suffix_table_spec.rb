require 'spec_helper'

RSpec.describe StringSearching::GoodSuffixTable do
  it "generates shift for PICNIC" do
    result = {
      0 => 6,
      1 => 6,
      2 => 6,
      3 => 6,
      4 => 3,
      5 => 6,
      6 => 1
    }
    pattern = "PICNIC"
    subject = described_class.generate(pattern)
    expect(subject).to eq(result)
  end

  it "generates shift table for WORD" do
    result = {
      0 => 4,
      1 => 4,
      2 => 4,
      3 => 4,
      4 => 1
    }
    pattern = "WORD"
    subject = described_class.generate(pattern)
    expect(subject).to eq(result)
  end

  it "generates shift for ABBABAB" do
    result = {
      0 => 5,
      1 => 5,
      2 => 5,
      3 => 5,
      4 => 2,
      5 => 5,
      6 => 4,
      7 => 1
    }
    pattern = "ABBABAB"
    subject = described_class.generate(pattern)
    expect(subject).to eq(result)
  end

  it "generates shift for GCAGAGAG" do
    result = {
      0 => 7,
      1 => 7,
      2 => 7,
      3 => 7,
      4 => 2,
      5 => 7,
      6 => 4,
      7 => 7,
      8 => 1
    }
    pattern = "GCAGAGAG"
    subject = described_class.generate(pattern)
    expect(subject).to eq(result)
  end
end
