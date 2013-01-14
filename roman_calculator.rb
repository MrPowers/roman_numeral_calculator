class RomanCalculator
  attr_reader :conversion
  def initialize(expression)
    @roman1, @operator, @roman2 = expression.split
    @conversion = {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 90 => "XC",
                  50 => "L", 40 => "XL", 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"}
  end

  def main
    number1 = roman_to_number(@roman1)
    number2 = roman_to_number(@roman2)
    number_to_roman(eval("#{number1} #{@operator} #{number2}"))
  end

  def roman_to_number(roman)
    roman = roman.split("")
    roman.map! { |number| conversion.invert[number] }
    result = []
    roman.each_with_index do |number, index|
      if index == 0
        result.push(number)
      elsif number > roman[index - 1]
        result.pop
        result.push(number - roman[index - 1])
      else
        result.push(number)
      end
    end
    result.inject(&:+)
  end

  def number_to_roman(number)
    result = ""
    conversion.each do |denominator, symbol|
      if number % denominator < number
        occurrences, number = number.divmod(denominator)
        occurrences.times { result += (conversion[denominator]) }
      end
    end
    result
  end
end