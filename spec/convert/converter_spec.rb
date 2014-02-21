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
    describe "#write_whole string" do
      it "returns the whole money part" do
        whole = WholePart.new '0.00'
        whole.word.should eq 'Zero'
      end

      it "returns One" do
        whole = WholePart.new '1.00'
        whole.word.should eq 'One'
      end
    end
  end
end
