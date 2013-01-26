# The program takes a mathematical expression
# with Roman Numerals instead of numbers
# and returns the result of the operation.
# It only supports multiplication, division, 
# addition, and substraction.
#
# Author::    Matthew Powers  (mailto:matthewkevinpowers@gmail.com)

# This class holds the mathematical expression
# with Roman Numerals. The main method 
# calculates the result and returns a Roman Numberal.
class RomanCalculator
  attr_reader :conversion
  # Splits the mathematical expression into two Roman Numerals and an operator  
  # Creates a conversion hash to convert between numbers and Roman Numerals
  def initialize(expression)
    @roman1, @operator, @roman2 = expression.split
    @conversion = {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 90 => "XC",
                  50 => "L", 40 => "XL", 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"}
  end

  # Converts the Roman Numerals to numbers, performs the mathematical operation,
  # and converts the result back to a Roman Numeral
  def main
    number1 = roman_to_number(@roman1)
    number2 = roman_to_number(@roman2)
    integer_result = number1.send(@operator.to_sym, number2)
    number_to_roman(integer_result)
  end

  # Converts a Roman Numeral to a number
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

  # Converts a number to a Roman Numeral
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