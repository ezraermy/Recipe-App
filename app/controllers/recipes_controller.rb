class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = current_user.recipes
    render 'index'
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @ingredients = @recipe.recipe_foods.includes(:food)
    render 'show'
  end

  def new
    @new_recipe = Recipe.new
    render 'new'
  end

  def create
    recipe = Recipe.new(user: current_user)
    recipe.assign_attributes(recipe_params)
    if recipe.save
      redirect_to recipes_path
      flash[:success] = 'The recipe was posted!'
    else
      flash.now[:error] = 'Could not post recipe, try again'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    if recipe.destroy
      flash[:success] = 'The recipe was deleted'
      redirect_to recipes_path
    else
      flash.now[:error] = 'Could not delete recipe, try again'
    end
  end

  def update
    recipe = Recipe.find_by(id: params[:id])
    if recipe.update_attribute(:public, !recipe.public)
      flash[:success] = 'The visibility was changed sucsessfully'
    else
      flash.now[:error] = 'Could not change visibility, try again'
    end
    redirect_to recipe
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true).all
    render 'public_recipes'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :public, :description)
  end
end
