require_dependency "tickle/application_controller"

module Tickle
  class PricingsController < ApplicationController
    def create
    @price = Pricing.calculate_price(pricing_params)
    end

    def index
      render :index
    end

    private
    def pricing_params
      params.require(:pricings).permit(:gender, :age, conditions: [])
    end
  end
end
