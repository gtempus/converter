module Convert
  class GroupParser
    def GroupParser.parse num
      groups = split_into_groups num
      split_each_group_into_units groups
    end
    
    private
    def GroupParser.split_into_groups num
      groups = ((num.reverse).split /(...)/).reject { |group| group.empty? }
      groups.map { |group| group.reverse }.map { |group| '%03i' % group.to_i }
    end

    def GroupParser.split_each_group_into_units groups
      groups.map { |group| (group.split(%r{\s*})).map { |digit_char| digit_char.to_i }}
    end
  end
end
