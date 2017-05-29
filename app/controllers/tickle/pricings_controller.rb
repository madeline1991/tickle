require_dependency "tickle/application_controller"

module Tickle
  class PricingsController < ApplicationController
    def create
      debugger
    end

    def index
      render :index
    end
  end
end
