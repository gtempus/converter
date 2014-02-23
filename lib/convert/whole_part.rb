require_relative 'group_parser.rb'
require_relative 'group.rb'

module Convert
  class WholePart
    GROUPS = %w{ hundred thousand million billion }
        
    def initialize full_amount
      maybe_whole = full_amount.match /^\d+/
      @whole = maybe_whole ? maybe_whole[0] : '0'
    end

    def word
      result = groups.reverse.map(&:name).join(' ').strip
      result.empty? ? 'zero' : result
    end

    def groups
      GROUPS.zip(GroupParser.parse @whole).map { |group| Group.new(group) }
                                          .reject(&:empty?)
    end
  end
end
