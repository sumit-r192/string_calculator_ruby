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

      invalid = number.include?(",#{new_delimiter}") || number.include?("#{new_delimiter},") || number.include?("\n#{new_delimiter}") || number.include?("#{new_delimiter}\n") || number.include?(",,") || number.include?(",\n") || number.include?("\n,")

      raise ArgumentError, "Invalid input: '#{number}'" if invalid
      raise ArgumentError, "Negative numbers not allowed: #{number.scan(/-\d+/).join(', ')}" if number.include?("-")

      response << number.split(/[,\n"#{new_delimiter}"]/).map(&:to_i).sum
    end

    response.length > 1 ? response : response.first
  end
end
