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

    context "with negative numbers" do
      it "throws an exception for a single negative number" do
        expect { StringCalculator.add("-1") }.to raise_error(RuntimeError, "negatives not allowed: -1")
      end
    
      it "throws an exception listing all negative numbers" do
        expect { StringCalculator.add("2,-4,3,-5") }.to raise_error(RuntimeError, "negatives not allowed: -4, -5")
      end
    end

    context "with numbers greater than 1000" do
      it "ignores numbers greater than 1000 in the sum" do
        expect(StringCalculator.add("2,1001")).to eq(2)
      end
    
      it "considers numbers exactly 1000" do
        expect(StringCalculator.add("1000,2")).to eq(1002)
      end
    end

    context "with new lines between numbers" do
      it "handles new lines as delimiters" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end
    
    context "with custom delimiter" do
      it "supports custom single character delimiter" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end
    
      it "supports custom delimiter of any length" do
        expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
      end
    
      it "supports multiple custom delimiters" do
        expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end
  end
end
