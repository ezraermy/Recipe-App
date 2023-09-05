class FoodsController < ApplicationController
    before_action :set_food, only: %i[show edit update destroy]
  
    # Index action to display a list of food items.
    def index
      @foods = Food.includes(:user).all
    end
  
    # Show action to display details of a specific food item.
    def show
    end

    # Custom action to generate a general shopping list summary.
    def general_shopping_list
        @foods = Food.all
        @food_items = @foods.length
        @price_sum = Food.sum(:price)
      end
    
      # New action to render a form for creating a new food item.
      def new
        @food = Food.new
      end
    
      # Edit action to render a form for editing a food item.
      def edit
      end
    
  end
  