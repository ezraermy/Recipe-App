class RecipeFoodsController < ApplicationController
  def new
    @new_ingredient = RecipeFood.new
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @foods = current_user.foods
    render 'new'
  end

  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    ingredient = RecipeFood.new(recipe: @recipe)
    ingredient.assign_attributes(recipe_food_params)
    if ingredient.save
      flash[:success] = 'The ingredient was added!'
    else
      flash[:error] = 'Could not add the ingredient, try again'
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    ingredient = RecipeFood.find_by(id: params[:recipe_id])
    @recipe = Recipe.find_by(id: params[:id])
    if ingredient.destroy
      flash[:success] = 'The recipe was deleted'
    else
      flash[:error] = 'Could not delete recipe, try again'
    end
    redirect_to recipe_path(@recipe)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
