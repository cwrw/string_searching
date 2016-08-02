require 'spec_helper'

RSpec.describe StringSearching::BoyerMooreSearch do
  it "returns nothing if pattern not found in text" do
    pattern = "PICNIC"
    text = "PETER PIPER HAD A PICK"
    subject = described_class.new(pattern, text)
    expect(subject.search).to eq([])
  end

  it "returns multiple indices of pattern if pattern is found in text" do
    pattern = "PICNIC"
    text = "PICNIC PIPER PICNIC A PICNIC"
    subject = described_class.new(pattern, text)
    expect(subject.search).to eq([0, 13, 22])
  end
end
