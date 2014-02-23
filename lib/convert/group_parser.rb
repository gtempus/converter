module Convert
  class GroupParser
    def GroupParser.parse num
      split groups_from num
    end
    
    private
    def GroupParser.groups_from num
      num.reverse.split(/(...)/).reject(&:empty?)
                                .map { |group| zero_pad group }
    end

    def GroupParser.zero_pad group
      '%03i' % group.reverse.to_i
    end

    def GroupParser.split groups
      groups.map { |group| group.split(//).map(&:to_i) }
    end
  end
end
