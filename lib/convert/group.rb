module Convert
  class Group
    AS_ONE = 0; AS_TEEN = 1; AS_TEN = 2
    
    NAME_FOR = [ %w{ \     \         \       }, # zeros have no display name
                 %w{ one   eleven    ten     },
                 %w{ two   twelve    twenty  },
                 %w{ three thirteen  thirty  },
                 %w{ four  fourteen  forty   },
                 %w{ five  fifteen   fifty   },
                 %w{ six   sixteen   sixty   },
                 %w{ seven seventeen seventy },
                 %w{ eight eighteen  eighty  },
                 %w{ nine  nineteen  ninety  }]
    
    def initialize number_group
      @group_name = number_group[0]
      @numbers = number_group[1]
    end

    def name
      return '' if zero?
      [hundreds_name, tens_and_ones_name, group_name].compact.reject(&:empty?).join ' '
    end

    def empty?() @numbers == nil end
    
    private
    def hundreds_name
      ["#{NAME_FOR[hundreds][AS_ONE]} hundred"] unless hundreds == 0
    end

    def tens_and_ones_name
      result = []
      if tens == 1 && ones > 0
        result << NAME_FOR[ones][AS_TEEN]
      else
        result << NAME_FOR[tens][AS_TEN] unless tens == 0
        result << NAME_FOR[ones][AS_ONE] unless ones == 0
      end
      result.join '-'
    end

    def group_name
      @group_name unless @group_name == 'hundred'
    end

    def hundreds() @numbers[0] end
    def tens()     @numbers[1] end
    def ones()     @numbers[2] end
    def zero?()    @numbers.reduce(:+) == 0 end
  end
end
