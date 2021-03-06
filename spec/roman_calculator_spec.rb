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

  context "#number_to_roman" do
    it "converts 19 to XIX" do
      roman_calc.number_to_roman(19).should eq "XIX"   
    end

    it "converts 3 to III" do
      roman_calc.number_to_roman(3).should eq "III"   
    end

    it "converts 1948 to MCMXLVIII" do
      roman_calc.number_to_roman(1948).should eq "MCMXLVIII"
    end

    it "converts 4949 to MMMMCMXLIX" do
      roman_calc.number_to_roman(4949).should eq "MMMMCMXLIX"
    end
  end

  context "#main" do
    it "VIII * III evaluates to XXIV" do
      roman_calc.main.should eq "XXIV"
    end

    it "MMMMCMXLIX minus MCMXLVIII should equal MMMI" do
      RomanCalculator.new("MMMMCMXLIX - MCMXLVIII").main.should eq "MMMI"
    end

    it "XCVI divided by III should equal XXXII" do
      RomanCalculator.new("XCVI / III").main.should eq "XXXII"
    end
  end
end