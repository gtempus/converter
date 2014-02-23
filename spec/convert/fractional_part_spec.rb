require 'spec_helper'

module Convert
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
end
