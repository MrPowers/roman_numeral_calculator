require_relative "../roman_calculator.rb"

describe RomanCalculator do
	let (:roman_calc) { RomanCalculator.new("VIII * III") }

	context "#roman_to_number" do
		it "converts XIX to 19" do
			roman_calc.roman_to_number("XIX").should eq 19
		end

		it "converts III to 3" do
			roman_calc.roman_to_number("III").should eq 3
		end

		it "converts XXIV to 24" do
			roman_calc.roman_to_number("XXIV").should eq 24
		end

		it "converts MCMXLIX to 1949" do
			roman_calc.roman_to_number("MCMXLIX").should eq 1949
		end

		it "converts V to 5" do
			roman_calc.roman_to_number("V").should eq 5
		end

		it "converts VIII to 8" do
			roman_calc.roman_to_number("VIII").should eq 8
		end



	end
end