require 'spec_helper'

module Convert
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
end
