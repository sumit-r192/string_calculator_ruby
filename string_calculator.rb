class StringCalculator
  def add(*numbers)
    return 0 if numbers.empty?

    response = []

    new_delimiter = ','
    numbers.each do |number|
      if number.include?('//')
        new_delimiter = number[2]
        number.slice!(0..3)
      end

      raise ArgumentError, "Invalid input: '#{number}'" if number.include?(",\n")
      raise ArgumentError, "Invalid input: '#{number}'" if number.include?("\n,")
      raise ArgumentError, "Invalid input: '#{number}'" if number.include?(",,")
      raise ArgumentError, "Invalid input: '#{number}'" if number.include?(",#{new_delimiter}")
      raise ArgumentError, "Invalid input: '#{number}'" if number.include?("#{new_delimiter},")
      raise ArgumentError, "Invalid input: '#{number}'" if number.include?("#{new_delimiter}\n")
      raise ArgumentError, "Invalid input: '#{number}'" if number.include?("\n#{new_delimiter}")
      raise ArgumentError, "Negative numbers not allowed: #{number.scan(/-\d+/).join(', ')}" if number.include?("-")

      response << number.split(/[,\n"#{new_delimiter}"]/).map(&:to_i).sum
    end

    response.length > 1 ? response : response.first
  end
end
