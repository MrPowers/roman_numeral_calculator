class RomanCalculator
	attr_reader :number_to_symbol, :symbol_to_number
	def initialize(expression) # VIII * III
		@roman1, @operator, @roman2 = expression.split
		@number_to_symbol = {1000 => "M", 500 => "D", 100 => "C", 50 => "L", 10 => "X", 5 => "V", 1 => "I"}
		@symbol_to_number = {"M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I" => 1}
	end

	def roman_to_number(roman)
		roman = roman.split("")
		roman.map! { |number| symbol_to_number[number] }
		result = []
		roman.each_with_index do |number, index|
			if index == 0
				result.push(number)
			elsif number > roman[index - 1]
				simplified_number = number - roman[index - 1]
				result.pop
				result.push(simplified_number)
			else
				result.push(number)
			end
		end
		result.inject(&:+)
	end

	def number_to_roman(number)
		
	end
end

c = RomanCalculator.new("VIII * III")
p c.roman_to_number("I")
