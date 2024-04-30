class StringCalculator
  def add(*numbers)
    return 0 if numbers.empty?

    numbers.each do |number|
      raise ArgumentError, "Invalid input: '#{number}'" if number.include?(",\n")
    end

    response = numbers.map { |number| number.split(/[,\n]/).map(&:to_i).sum }
    response.length > 1 ? response : response.first
  end
end
