require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe "#add" do
    it "returns 0 for an empty string" do
      calc = StringCalculator.new
      expect(calc.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
      calc = StringCalculator.new
      expect(calc.add("5")).to eq(5)
    end

    it "returns the sum of two numbers" do
      calc = StringCalculator.new
      expect(calc.add("1,2")).to eq(3)
    end

    it "returns the sum of multiple numbers" do
      calc = StringCalculator.new
      expect(calc.add("1,2,3,4,5")).to eq(15)
    end
  end
end
