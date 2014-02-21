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
    AS_ONE = 0
    AS_TEEN = 1
    AS_TEN = 2
    
    WORD_FOR = {
      0 => ['zero', nil, nil],
      1 => ['one', 'eleven', 'ten'],
      2 => ['two', 'twelve', 'twenty'],
      3 => ['three', 'thirteen', 'thirty'],
      4 => ['four', 'fourteen', 'forty'],
      5 => ['five', 'fifteen', 'fifty'],
      6 => ['six', 'sixteen', 'sixty'],
      7 => ['seven', 'seventeen', 'seventy'],
      8 => ['eight', 'eighteen', 'eighty'],
      9 => ['nine', 'nineteen', 'ninety']
    }
        
    def initialize full_amount
      maybe_whole = full_amount.match /^\d+/
      @whole = maybe_whole ? maybe_whole[0].to_i : 0
    end

    def word
      result = ''
      thousands = (@whole / 1000)
      tens = thousands / 10
      ones = thousands % 10
      result = result.concat("#{word_decide tens, ones} thousand ") unless thousands == 0
      remainder = @whole % 1000
      hundreds = (remainder / 100)
      result = result.concat("#{word_decide 0, hundreds} hundred ") unless hundreds == 0
      remainder = @whole % 100
      tens = (remainder / 10)
      ones = (remainder % 10)
      tens_ones = word_decide(tens, ones)
      if tens_ones == 'zero'
        result = tens_ones if result.empty?
      else
        result = result.concat tens_ones
      end
      result.strip
    end

    def word_decide tens, ones
      if tens == 0
        return WORD_FOR[ones][AS_ONE]
      end
      if ones == 0
        return WORD_FOR[tens][AS_TEN]
      end
      if tens == 1 && ones > 0
        return WORD_FOR[ones][AS_TEEN]
      end
      return "#{WORD_FOR[tens][AS_TEN]}-#{WORD_FOR[ones][AS_ONE]}"
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
