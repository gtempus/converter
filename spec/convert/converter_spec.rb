require 'spec_helper'

module Convert
  describe Converter do
    describe "#convert" do
      it "converts a number to a very verbose string representation" do
        converter = Converter.new
        converter.convert(0.00).should eq "Zero and 00/100 dollars"
      end
    end
  end
end
