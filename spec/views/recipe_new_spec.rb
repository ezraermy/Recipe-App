require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'recipe show page' do
    before(:each) do
      @user = User.create(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @user.save!
      visit new_recipe_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
    end

    it 'Creates a new recipe' do
      fill_in 'recipe[name]', with: 'my recipe'
      select 'Private', from: 'recipe[public]'
      fill_in 'recipe[preparation_time]', with: '1'
      fill_in 'recipe[cooking_time]', with: '1'
      fill_in 'recipe[description]', with: 'My best one'
      click_button 'Post recipe'
      expect(page).to have_content('my recipe')
    end

    it 'checks select options' do
      expect(page).to have_content('Private')
      expect(page).to have_content('Public')
    end
  end
end
