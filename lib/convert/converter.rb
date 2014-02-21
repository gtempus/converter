class Converter
  def convert num
    "Zero and 00/100 dollars" if num.to_f == 0.00
  end
end
