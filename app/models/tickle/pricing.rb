module Tickle
  class Pricing < ApplicationRecord
    def  self.calculate_price(params)
      debugger
      total = 100
      total += self.age_cost(params["age"])
      total = total * conditions(params["conditions"]) + total
      total -= gender_deduction(params["gender"])
    end

  end
end
