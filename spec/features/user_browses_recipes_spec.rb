require "rails_helper"

RSpec.feature 'Recipe browsing', :type => :feature do
    scenario 'they can view the homepage' do
        visit root_path
        expect(page).to have_text 'Recipes'
    end

    scenario 'they can view breakfast recipes' do 
        visit recipes_meal_path(slug: 'breakfast')
        within('h1') do 
            expect(page).to have_content 'Breakfast'
        end
    end
    
    scenario 'they can view lunch recipes' do 
        visit recipes_meal_path(slug: 'lunch')
        within('h1') do 
            expect(page).to have_content 'Lunch'
        end
    end

    scenario 'they can view dinner recipes' do 
        visit recipes_meal_path(slug: 'dinner')
        within('h1') do 
            expect(page).to have_content 'Dinner'
        end
    end

    scenario 'they can view other recipes' do 
        visit recipes_meal_path(slug: 'other')
        within('h1') do 
            expect(page).to have_content 'Other'
        end
    end

    scenario 'they can click a link and view a recipe' do
        visit recipes_path 
        click_link("link-to-recipe-#{Recipe.count}")
        expect(current_path).to eq "/recipes/#{Recipe.count}"
    end

    scenario 'they see pagination at the top of index' do 
        100.times {create(:recipe)}
        visit root_path
        expect(page).to have_css('nav.pagination') 
    end
    scenario 'they see pagination at the top of breakfast' do 
        100.times {create(:recipe, meal_category: 'breakfast')}
        visit recipes_meal_path(slug: 'breakfast') 
        expect(page).to have_css('nav.pagination')
    end
    scenario 'they see pagination at the top of lunch' do 
        100.times {create(:recipe, meal_category: 'lunch')}
        visit recipes_meal_path(slug: 'lunch') 
        expect(page).to have_css('nav.pagination')
    end
    scenario 'they see pagination at the top of dinner' do 
        100.times {create(:recipe, meal_category: 'dinner')}
        visit recipes_meal_path(slug: 'dinner') 
        expect(page).to have_css('nav.pagination')
    end
    scenario 'they see pagination at the top of other' do 
        100.times {create(:recipe, meal_category: 'other')}
        visit recipes_meal_path(slug: 'other') 
        expect(page).to have_css('nav.pagination')
    end
    scenario 'the pagination encompasses all recipes' do 
        visit recipes_path(page: (Recipe.count / 10) + 1) 
        expect(page).to have_content(Recipe.first.title)
    end
end