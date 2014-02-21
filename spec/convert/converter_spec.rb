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

  describe WholePart do
    describe "#word" do
      it "returns 'ones'" do
        (WholePart.new '0.00').word.should eq 'Zero'
        (WholePart.new '1.00').word.should eq 'One'        
        (WholePart.new '2.00').word.should eq 'Two'
        (WholePart.new '3.00').word.should eq 'Three'
        (WholePart.new '4.00').word.should eq 'Four'
        (WholePart.new '5.00').word.should eq 'Five'
        (WholePart.new '6.00').word.should eq 'Six'
        (WholePart.new '7.00').word.should eq 'Seven'
        (WholePart.new '8.00').word.should eq 'Eight'
        (WholePart.new '9.00').word.should eq 'Nine'
      end

      it "returns 'tens'" do
        (WholePart.new '10.00').word.should eq 'Ten'
        (WholePart.new '20.00').word.should eq 'Twenty'
        (WholePart.new '30.00').word.should eq 'Thirty'
        (WholePart.new '40.00').word.should eq 'Fourty'
        (WholePart.new '50.00').word.should eq 'Fifty'
        (WholePart.new '60.00').word.should eq 'Sixty'
        (WholePart.new '70.00').word.should eq 'Seventy'
        (WholePart.new '80.00').word.should eq 'Eighty'
        (WholePart.new '90.00').word.should eq 'Ninety'
      end

      it "returns 'teens'" do
        (WholePart.new '11.00').word.should eq 'Eleven'
        (WholePart.new '12.00').word.should eq 'Twelve'
        (WholePart.new '13.00').word.should eq 'Thirteen'
        (WholePart.new '14.00').word.should eq 'Fourteen'
        (WholePart.new '15.00').word.should eq 'Fifteen'
        (WholePart.new '16.00').word.should eq 'Sixteen'
        (WholePart.new '17.00').word.should eq 'Seventeen'
        (WholePart.new '18.00').word.should eq 'Eighteen'
        (WholePart.new '19.00').word.should eq 'Nineteen'
      end
    end
  end
end
