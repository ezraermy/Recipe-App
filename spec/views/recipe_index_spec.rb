require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'recipe index page' do
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

      @second_recipe = Recipe.create(
        name: 'my second recipe',
        preparation_time: 12,
        cooking_time: 20,
        public: false,
        description: 'Great recipe',
        user: @user
      )
      @user.save!
      visit recipes_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
    end

    it 'makes sure all the recipes are displaying' do
      expect(page).to have_content(@first_recipe.name)
      expect(page).to have_content(@second_recipe.name)
    end

    it 'makes sure it can delete a recipe' do
      find('button:not([disabled])', text: 'Delete recipe', match: :first).click
      expect(page).to_not have_content(@first_recipe.name)
    end

    it 'cliking on the title it takes to recipe details' do
      click_on @first_recipe.name
      expect(page).to have_current_path(recipe_path(@first_recipe))
    end

    it 'cliking on the add recipe button' do
      click_on 'Add a new recipe'
      expect(page).to have_current_path(new_recipe_path)
    end
  end
end
