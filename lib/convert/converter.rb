module Convert
  class Converter
    def convert num
      whole = WholePart.new num
      cents = FractionalPart.new num
      "#{whole.word} and #{cents.fraction} dollars"
    end
  end

  class WholePart
    def initialize full_amount
      maybe_whole = full_amount.match /^\d+/
      @whole = maybe_whole ? maybe_whole[0] : '0'
    end

    def word
      @whole == '0' ? 'Zero' : 'One'
    end
  end

  class FractionalPart
    def initialize full_amount
      maybe_cents = full_amount.match /\.(\d{2})$/
      @cents = maybe_cents ? maybe_cents[1] : '00'
    end

    def fraction
      "#{@cents}/100"
    end
  end
end
