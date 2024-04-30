require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe "#add" do
    it "returns 0 for an empty string" do
      calc = StringCalculator.new
      expect(calc.add("")).to eq(0)
    end
  end
end
