require 'spec_helper'

module Convert
  describe Converter do
    describe "#convert" do
      it "converts the cents to a fraction" do
        converter = Converter.new
        converter.convert('0.00').should eq "Zero and 00/100 dollars"
      end

      it "converts ones" do
        converter = Converter.new
        converter.convert('1.00').should eq "One and 00/100 dollars"
      end
    end
  end

  describe FractionalPart do
    describe "#write_cents string" do
      it "returns the fractional money part" do
        cents = FractionalPart.new '0.00'
        cents.fraction.should eq '00/100'
      end

      it "appends 00/100 if there are no cents" do
        cents = FractionalPart.new '0'
        cents.fraction.should eq '00/100'
      end
    end
  end

  describe GroupParser do
    it "splits number strings into groups of three" do
      GroupParser.parse('1').should eq [[0, 0, 1]]
      GroupParser.parse('99').should eq [[0, 9, 9]]
      GroupParser.parse('100').should eq [[1, 0, 0]]
      GroupParser.parse('499').should eq [[4, 9, 9]]
      GroupParser.parse('3400').should eq [[4, 0, 0], [0, 0, 3]]
      GroupParser.parse('123090').should eq [[0, 9, 0], [1, 2, 3]]
    end
  end

  describe WholePart do
    describe "#word" do
      it "returns 'ones'" do
        (WholePart.new '0.00').word.should eq 'zero'
        (WholePart.new '1.00').word.should eq 'one'        
        (WholePart.new '2.00').word.should eq 'two'
        (WholePart.new '3.00').word.should eq 'three'
        (WholePart.new '4.00').word.should eq 'four'
        (WholePart.new '5.00').word.should eq 'five'
        (WholePart.new '6.00').word.should eq 'six'
        (WholePart.new '7.00').word.should eq 'seven'
        (WholePart.new '8.00').word.should eq 'eight'
        (WholePart.new '9.00').word.should eq 'nine'
      end

      it "returns 'tens'" do
        (WholePart.new '10.00').word.should eq 'ten'
        (WholePart.new '20.00').word.should eq 'twenty'
        (WholePart.new '30.00').word.should eq 'thirty'
        (WholePart.new '40.00').word.should eq 'forty'
        (WholePart.new '50.00').word.should eq 'fifty'
        (WholePart.new '60.00').word.should eq 'sixty'
        (WholePart.new '70.00').word.should eq 'seventy'
        (WholePart.new '80.00').word.should eq 'eighty'
        (WholePart.new '90.00').word.should eq 'ninety'
      end

      it "returns 'teens'" do
        (WholePart.new '11.00').word.should eq 'eleven'
        (WholePart.new '12.00').word.should eq 'twelve'
        (WholePart.new '13.00').word.should eq 'thirteen'
        (WholePart.new '14.00').word.should eq 'fourteen'
        (WholePart.new '15.00').word.should eq 'fifteen'
        (WholePart.new '16.00').word.should eq 'sixteen'
        (WholePart.new '17.00').word.should eq 'seventeen'
        (WholePart.new '18.00').word.should eq 'eighteen'
        (WholePart.new '19.00').word.should eq 'nineteen'
      end

      it "returns 'tens & ones' hyphenated" do
        (WholePart.new '21.00').word.should eq 'twenty-one'
      end

      it "returns 'hundreds'" do
        (WholePart.new '100.00').word.should eq 'one hundred'        
        (WholePart.new '101.00').word.should eq 'one hundred one'
        (WholePart.new '113.00').word.should eq 'one hundred thirteen'
      end

      it "returns 'thousands'" do
        (WholePart.new '1000.00').word.should eq 'one thousand'
      end
    end
  end
end
