class FoodsController < ApplicationController
    before_action :set_food, only: %i[show edit update destroy]
  
    # Index action to display a list of food items.
    def index
      @foods = Food.includes(:user).all
    end
  
    # Show action to display details of a specific food item.
    def show
    end
    
  end
  