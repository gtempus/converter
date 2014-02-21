module Convert
  class Converter
    def convert num
      whole = WholePart.new num
      cents = FractionalPart.new num
      result = "#{whole.word} and #{cents.fraction} dollars".capitalize
      result = result.gsub /zero /, ''
    end
  end

  class WholePart
    ONES_GROUP = {
      0 => "zero",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine"
    }

    TEENS_GROUP = {
      1 => "eleven",
      2 => "twelve",
      3 => "thirteen",
      4 => "fourteen",
      5 => "fifteen",
      6 => "sixteen",
      7 => "seventeen",
      8 => "eighteen",
      9 => "nineteen"
    }

    TENS_GROUP = {
      1 => "ten",
      2 => "twenty",
      3 => "thirty",
      4 => "forty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety"
    }
        
    def initialize full_amount
      maybe_whole = full_amount.match /^\d+/
      @whole = maybe_whole ? maybe_whole[0].to_i : 0
    end

    def word
      result = ''
      hundreds = (@whole / 100)
      result = result.concat("#{word_decide 0, hundreds} hundred ") unless hundreds == 0
      remainder = @whole % 100
      tens = (remainder / 10)
      ones = (remainder % 10)
      return result.concat word_decide(tens, ones)
    end

    def word_decide tens, ones
      if tens == 0
        return ONES_GROUP[ones]
      end
      if ones == 0
        return TENS_GROUP[tens]
      end
      if tens == 1 && ones > 0
        return TEENS_GROUP[ones]
      end
      return "#{TENS_GROUP[tens]}-#{ONES_GROUP[ones]}"
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
