require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'recipe show page' do
    before(:each) do
      @user = User.create(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @first_recipe = Recipe.create(
        name: 'my recipe',
        preparation_time: 60,
        cooking_time: 40,
        public: false,
        description: 'text',
        user: @user
      )
      @user.save!
      visit recipes_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
    end
    it 'makes sure the recipe details are displaying' do
      visit recipe_path(@first_recipe)
      expect(page).to have_content(@first_recipe.name)
      expect(page).to have_content(@first_recipe.preparation_time)
      expect(page).to have_content(@first_recipe.cooking_time)
      expect(page).to have_content(@first_recipe.description)
    end

    it 'makes sure it can delete a recipe' do
      visit recipe_path(@first_recipe)
      click_button 'Delete recipe'
      expect(page).to_not have_content(@first_recipe.name)
    end
  end
end
