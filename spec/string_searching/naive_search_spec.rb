require 'spec_helper'

RSpec.describe StringSearching::NaiveSearch do
  it "returns nothing if pattern not found in text" do
    pattern = "PICNIC"
    text = "PETER PIPER HAD A PICK"
    subject = described_class.new(pattern, text)
    expect(subject.search).to eq([])
  end

  it "returns multiple indices of pattern PICNIC in text" do
    pattern = "PICNIC"
    text = "PICNIC PIPER PICNIC A PICNICICPICNITPICNIC"
    subject = described_class.new(pattern, text)
    expect(subject.search).to eq([0, 13, 22, 36])
  end

  it "returns multiple indices of pattern ABBABAB in text" do
    pattern = "ABBABAB"
    text = "ABCAABBABABBABACBAABBABAB"
    subject = described_class.new(pattern, text)
    expect(subject.search).to eq([4, 18])
  end

  it "returns multiple indices of pattern GCAGAGAG in text" do
    pattern = "GCAGAGAG"
    text = "GCATCGCAGAGAGTATACAGTACG"
    subject = described_class.new(pattern, text)
    expect(subject.search).to eq([5])
  end
end
