module Convert
  class Converter
    def convert num
      whole = WholePart.new num
      cents = FractionalPart.new num
      result = "#{whole.word} and #{cents.fraction} dollars".capitalize
      result = result.gsub /zero /, ''
    end
  end

  class GroupParser
    def GroupParser.parse num
      groups = split_into_groups num
      split_each_group_into_units groups
    end
    private
    def GroupParser.split_into_groups num
      groups = ((num.reverse).split /(...)/).reject { |group| group.empty? }
      groups.map { |group| group.reverse }.map { |group| '%03i' % group.to_i }.reverse
    end

    def GroupParser.split_each_group_into_units groups
      groups.map { |group| (group.split(%r{\s*})).map { |digit_char| digit_char.to_i }}
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
      result = result.concat the_thousands
      result = result.concat the_hundreds
      result = result.concat the_rest unless !result.empty? && the_rest == 'zero'
      result.strip
    end

    def the_thousands
      thousands = (@whole / 1000) % 100
      tens = thousands / 10
      ones = thousands % 10
      return "#{word_decide tens, ones} thousand " unless thousands == 0
      ''
    end

    def the_hundreds
      hundreds = (@whole / 100) % 10
      tens = hundreds / 10
      ones = hundreds % 10
      return "#{word_decide tens, ones} hundred " unless hundreds == 0
      ''
    end

    def the_rest
      tens = (@whole / 10) % 10
      ones = (@whole % 10)
      word_decide(tens, ones)
    end

    def word_decide tens, ones
      return '' if tens > 9 || ones > 9
      if tens == 0
        return WORD_FOR[ones][AS_ONE]
      end
      if ones == 0
        return WORD_FOR[tens][AS_TEN]
      end
      return WORD_FOR[ones][AS_TEEN] if teen? (tens.to_i*10 + ones.to_i)
      return "#{WORD_FOR[tens][AS_TEN]}-#{WORD_FOR[ones][AS_ONE]}"
    end

    def teen? value
      value > 10 && value < 20
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
