require 'spec_helper'

RSpec.describe StringSearching::GoodSuffixTable do
  context 'shift table for reoccurance of suffix in pattern' do
    it "generates shift for PICNIC" do
      pattern = "PICNIC"
      subject = described_class.generate_table_one(pattern)
      expect(subject).to eq(0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 3, 5 => 0, 6 => 1)
    end

    it "generates shift table for WORD" do
      pattern = "WORD"
      subject = described_class.generate_table_one(pattern)
      expect(subject).to eq(0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 1)
    end

    it "generates shift for ABBABAB" do
      pattern = "ABBABAB"
      subject = described_class.generate_table_one(pattern)
      expect(subject).to eq(0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 2, 5 => 0, 6 => 4, 7 => 1)
    end
  end
end
