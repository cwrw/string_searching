require 'spec_helper'

RSpec.describe StringSearching::GoodSuffixTable do
  it "generates shift for PICNIC" do
    pattern = "PICNIC"
    subject = described_class.generate(pattern)
    expect(subject).to eq(0 => 6, 1 => 6, 2 => 6, 3 => 6, 4 => 3, 5 => 6, 6 => 1)
  end

  it "generates shift table for WORD" do
    pattern = "WORD"
    subject = described_class.generate(pattern)
    expect(subject).to eq(0 => 4, 1 => 4, 2 => 4, 3 => 4, 4 => 1)
  end

  it "generates shift for ABBABAB" do
    pattern = "ABBABAB"
    subject = described_class.generate(pattern)
    expect(subject).to eq(0 => 5, 1 => 5, 2 => 5, 3 => 5, 4 => 2, 5 => 5, 6 => 4, 7 => 1)
  end
end
