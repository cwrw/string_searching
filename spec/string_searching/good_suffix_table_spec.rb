require 'spec_helper'

RSpec.describe StringSearching::GoodSuffixTable do
  it "generates shift for PICNIC" do
    pattern = "PICNIC"
    subject = described_class.generate(pattern)
    expect(subject).to eq(0 => 6, 1 => 4, 2 => 5, 3 => 6, 4 => 6, 5 => 6, 6 => 7)
  end

   it "generates shift table for WORD" do
    pattern = "WORD"
    subject = described_class.generate(pattern)
    expect(subject).to eq(0 => 4, 1 => 4, 2 => 4, 3 => 4, 4 => 5)
  end

  it "generates shift for ABBABAB" do
    pattern = "ABBABAB"
    subject = described_class.generate(pattern)
    expect(subject).to eq(0 => 5, 1 => 6, 2 => 4, 3 => 5, 4 => 6, 5 => 7, 6 => 7, 7 => 8)
  end
end
