require_dependency "tickle/application_controller"

module Tickle
  class PricingsController < ApplicationController
    def create
      allowed_params = pricing_params
      # debugger
      flash[:errors] = []
      unless valid_age?(allowed_params["age"])
        flash[:errors] << age_errors(allowed_params["age"])
      end

      if allowed_params["gender"].nil?
        flash[:errors] << "You must select a gender"
      end

      if flash[:errors].empty?
        @price = calculate_price(allowed_params)
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
      @price += age_cost(params["age"])
      @price = (@price * conditions(params["conditions"])) + @price
      @price -= gender_deduction(params["gender"])
      @price.round(0)
    end

    def age_cost(age)
      (age.to_i - 18) / 5 * 20
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
      debugger
      total
    end

    def gender_deduction(gender)
      gender == "Female" ? 12 : 0
    end

    def valid_age?(age)
      age.to_i >= 18
    end

    def age_errors(age)
      if age.nil?
        "Age cannot be blank."
      elsif age.to_i < 18
       "You can only get a quote if you are 18 or over"
      end
    end

  end
end
