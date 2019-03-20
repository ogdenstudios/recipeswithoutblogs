require "rails_helper"
RSpec.feature 'Recipe management', :type => :feature do
    scenario 'they cannot view the new recipe form without being signed in' do 
        visit new_recipe_path
        expect(current_path).to eq '/users/sign_in'
    end
    scenario 'they can view the new recipe form when signed in' do 
        user = create(:user)
        visit new_user_session_path 
        fill_in('user_email', :with => user.email)
        fill_in('user_password', :with => user.password)
        click_button('Log in')
        visit new_recipe_path
        expect(current_path).to eq '/recipes/new'
    end
    scenario 'they cannot view their recipes without being signed in' do 
        visit recipes_mine_path 
        expect(current_path).to eq '/users/sign_in'
    end
    scenario 'they can view their recipes' do 
        user = create(:user) 
        login_as(user)
        visit recipes_mine_path 
        expect(current_path).to eq '/recipes/mine'
    end
    scenario 'they cannot update a recipe without being signed in' do 
        visit '/recipes/1/edit'
        expect(current_path).to eq '/users/sign_in'
    end
    scenario "they cannot update another user's recipes" do 
        user = create(:user) 
        login_as(user)
        visit '/recipes/1/edit'
        expect(current_path).to eq '/'
    end
    scenario 'they can update their recipes' do 
        user = create(:user)
        recipe = create(:recipe, user_id: user.id)
        login_as(user)
        visit "/recipes/#{recipe.id}/edit"
        expect(current_path).to eq "/recipes/#{recipe.id}/edit"
    end
    scenario 'they can delete their recipes', :js => true do
        user = create(:user)
        recipe = create(:recipe, user_id: user.id)
        login_as(user)
        visit "/recipes/mine"
        click_on(recipe.title)
        accept_alert do 
            click_on("Delete")
        end
        expect(Recipe.find(recipe.id)).to eq nil
    end
end