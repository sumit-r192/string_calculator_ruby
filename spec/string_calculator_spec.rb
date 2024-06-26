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

    # Allow the add method to handle an any amount of numbers.
    it "returns the sum of multiple numbers in multiple strings" do
      calc = StringCalculator.new
      expect(calc.add("1,2", "1,2,3")).to eq([3, 6])
    end

    it "returns the sum of multiple numbers separate by \n instead of comma" do
      calc = StringCalculator.new
      expect(calc.add("1,2\n3,4\n5")).to eq(15)
    end

    it "returns an error for invalid input '1,\n'" do
      calc = StringCalculator.new
      expect { calc.add("1,\n") }.to raise_error(ArgumentError, "Invalid input: '1,\n'")
    end

    it "throws an exception for negative numbers" do
      calc = StringCalculator.new
      expect { calc.add("1,-2,3,4") }.to raise_error(ArgumentError, "Negative numbers not allowed: -2")
    end

    it "throws an exception for all negative numbers" do
      calc = StringCalculator.new
      expect { calc.add("1,-2,3,-4,5") }.to raise_error(ArgumentError, "Negative numbers not allowed: -2, -4")
    end

    it "throws an exception for all negative numbers from initial string" do
      calc = StringCalculator.new
      expect { calc.add("1,-2,3,-4,5", "1,2,3,4,-5") }.to raise_error(ArgumentError, "Negative numbers not allowed: -2, -4")
    end

    it "throws an exception for all negative numbers from initial string" do
      calc = StringCalculator.new
      expect { calc.add("1,2,3,4,5", "1,2,-3,4,-5") }.to raise_error(ArgumentError, "Negative numbers not allowed: -3, -5")
    end

    it "returns an error for invalid input '1,,2'" do
      calc = StringCalculator.new
      expect { calc.add("1,,2") }.to raise_error(ArgumentError, "Invalid input: '1,,2'")
    end

    it "supports different delimiters" do
      calc = StringCalculator.new
      expect(calc.add("//;\n1;2")).to eq(3)
    end

    it "returns an error for invalid input with new delimiter '1;,2'" do
      calc = StringCalculator.new
      expect { calc.add("//;\n1;,2") }.to raise_error(ArgumentError, "Invalid input: '1;,2'")
    end

  end
end
