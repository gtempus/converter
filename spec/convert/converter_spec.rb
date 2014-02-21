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
        converter.convert('1').should eq "One and 00/100 dollars"
      end
    end
  end
end
