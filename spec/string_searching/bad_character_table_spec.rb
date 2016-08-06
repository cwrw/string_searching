require 'spec_helper'

RSpec.describe StringSearching::BadCharacterTable do
  it "generates shift for PICNIC" do
    pattern = "PICNIC"
    subject = described_class.generate(pattern)
    expect(subject).to eq("P" => 5, "I" => 1, "C" => 3, "N" => 2)
  end

   it "generates shift table for WORD" do
    pattern = "WORD"
    subject = described_class.generate(pattern)
    expect(subject).to eq("W" => 3, "O" => 2, "R" => 1, "D" => 4)
  end
end
