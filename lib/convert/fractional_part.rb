module Convert
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
