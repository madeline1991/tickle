require_dependency "tickle/application_controller"

module Tickle
  class PricingsController < ApplicationController
    def create
      params = pricing_params

      @errors = []
      @errors << age_errors(params["age"])
      @errors << gender_errors(params["gender"])

      if @errors.empty?
        @price = calculate_price(params)
        render :create
      else
        redirect_to pricings_url
      end
    end

    def index
      render :index
    end

    private
    def pricing_params
      params.require(:pricings).permit(:gender, :age, conditions: [])
    end

    def calculate_price(params)
      @price = 100
      @price += age_cost(params["age"].to_i)
      @price = @price * conditions(params["conditions"]) + @price
      @price -= gender_deduction(params["gender"])
    end

    def age_cost(age)
      (age - 18) / 5 * 20
    end

    def conditions(conditions)
      return 0 if conditions.nil?
      total = 0
      conditions.each do |condition|
        case condition
        when "Allergies"
          total += 0.01
        when "Sleep Apnea"
          total += 0.06
        when "Heart Disease"
          total += 0.17
        else
          total += 0
        end
      end
      total
    end

    def gender_deduction(gender)
      gender == "Female" ? 12 : 0
    end

    def age_errors(age)
      if age.nil?
        @errors << "Age cannot be blank."
      elsif age.to_i < 18
        @errors << "You can only get a quote if you are 18 or over"
      end
    end

    def gender_errors(gender)
      if params["gender"].nil?
        @errors << "Gender can't be blank"
      end
    end
  end
end
