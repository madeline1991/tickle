module Tickle
  class Pricing < ApplicationRecord
    def  self.calculate_price(params)
      debugger
      total = 100
      total += age_cost(age)
      total = total * conditions(conditions) + total
      total -= gender_deduction(gender)
    end

    def age_cost(age)
      (age - 18) / 5 * 20
    end

    def conditions(conditions)
      total = 0
      conditions.each do |condition|
        case condition
        when "Allergies"
          total += 0.01
        when "Sleep Apnea"
          total += 0.06
        when "Heart Disease"
          total += 0.17
        end
      end
      total
    end

    def gender_deduction(gender)
      gender == "Female" ? 12 : 0
    end
  end
end
