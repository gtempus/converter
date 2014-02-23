require_relative 'group_parser.rb'

module Convert
  class WholePart
    AS_ONE = 0
    AS_TEEN = 1
    AS_TEN = 2
    
    NUMBER_NAME_FOR = [
                       ['',      '',          ''],       # zeros have no display name
                       ['one',   'eleven',    'ten'],
                       ['two',   'twelve',    'twenty'],
                       ['three', 'thirteen',  'thirty'],
                       ['four',  'fourteen',  'forty'],
                       ['five',  'fifteen',   'fifty'],
                       ['six',   'sixteen',   'sixty'],
                       ['seven', 'seventeen', 'seventy'],
                       ['eight', 'eighteen',  'eighty'],
                       ['nine',  'nineteen',  'ninety']
                      ]

    GROUP_NAMES = [
                   '',         # no group name for the first three place values
                   'thousand',
                   'million',
                   'billion'
                  ]
        
    def initialize full_amount
      maybe_whole = full_amount.match /^\d+/
      @whole = maybe_whole ? maybe_whole[0] : '0'
    end

    def word
      print_the_whole_word_from group_names
    end

    def group_names
      result = []
      number_groups.each do | group |
        result.unshift name_the_numbers_in_the group
      end
      result
    end
    
    def number_groups
      (GROUP_NAMES.zip(GroupParser.parse @whole)).reject { |group| an_empty? group }
    end

    def an_empty? group
      group[1] == nil
    end

    def name_the_numbers_in_the group
      group_name = []
      group_name << "#{NUMBER_NAME_FOR[group[1][0]][AS_ONE]} hundred" unless group[1][0] == 0
      group_name << "#{word_decide(group[1][1], group[1][2])} #{group[0]}".strip unless (group[1][0] == 0 && group[1][1] == 0 && group[1][2] == 0)
      group_name.join ' '
    end

    def word_decide tens, ones
      return '' if tens == 0 && ones == 0
      result = []
      if tens == 1 && ones > 0
        result << NUMBER_NAME_FOR[ones][AS_TEEN]
      else
        result << NUMBER_NAME_FOR[tens][AS_TEN] unless tens == 0
        result << NUMBER_NAME_FOR[ones][AS_ONE] unless ones == 0
      end
      result.join '-'
    end

    def print_the_whole_word_from group_names
      the_word = group_names.join(' ').strip
      the_word = 'zero' if the_word.empty?
      the_word
    end
  end
end
