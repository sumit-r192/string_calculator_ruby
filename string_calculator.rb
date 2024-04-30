class StringCalculator
  def add(*numbers)
    return 0 if numbers.empty?

    new_delimiter = ','
    numbers.each do |number|
      if number.include?('//')
        new_delimiter = number[2]
        number.slice!(0..3)
      end
    end

    numbers.each do |number|
      raise ArgumentError, "Invalid input: '#{number}'" if number.include?(",\n")
      raise ArgumentError, "Invalid input: '#{number}'" if number.include?(",,")
      raise ArgumentError, "Negative numbers not allowed: #{number.scan(/-\d+/).join(', ') }" if number.include?("-")
    end

    response = numbers.map { |number| number.split(/[,\n, "#{new_delimiter}"]/).map(&:to_i).sum }
    response.length > 1 ? response : response.first
  end
end
