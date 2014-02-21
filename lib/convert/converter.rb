class Converter
  def convert num
    amount = num.match /^\d*\.?(\d{2})$/
    cents = amount ? amount[1] : '00'
    "Zero and #{cents}/100 dollars"
  end
end
