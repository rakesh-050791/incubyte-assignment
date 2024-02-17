require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe '.add' do
    context "with an empty string" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context "with up to two numbers" do
      it "returns the number for a single number" do
        expect(StringCalculator.add("1")).to eq(1)
      end
    
      it "returns the sum for two numbers" do
        expect(StringCalculator.add("1,2")).to eq(3)
      end
    end
  end
end
