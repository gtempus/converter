require 'spec_helper'

module Convert
  describe Group do
    describe "#empty?" do
      it "returns true if there are no numbers for the group" do
        group = Group.new(["thousand", nil])
        group.empty?.should be true
      end
    end

    describe "#name" do
      it "returns the name of the number group" do
        group = Group.new(["thousand", [0, 0, 1]])
        group.name.should eq 'one thousand'
      end
    end
  end
end
