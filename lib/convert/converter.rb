require_relative 'whole_part.rb'
require_relative 'fractional_part.rb'

module Convert
  class Converter
    def convert num
      whole = WholePart.new num
      cents = FractionalPart.new num
      "#{whole.word} and #{cents.fraction} dollars".capitalize
    end
  end
end
