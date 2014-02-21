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
      @whole = maybe_whole ? maybe_whole[0].to_i : 0
    end

    def word
      tens = (@whole / 10).to_s
      ones = (@whole % 10).to_s

      value = (tens + ones).to_i

      tens_group = {
        0 => "Zero",
        1 => "One",
        2 => "Two",
        3 => "Three",
        4 => "Four",
        5 => "Five",
        6 => "Six",
        7 => "Seven",
        8 => "Eight",
        9 => "Nine",
        10 => "Ten",
        11 => "Eleven",
        12 => "Twelve",
        13 => "Thirteen",
        14 => "Fourteen",
        15 => "Fifteen",
        16 => "Sixteen",
        17 => "Seventeen",
        18 => "Eighteen",
        19 => "Nineteen"
      }
      
      tens_group[value]
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
