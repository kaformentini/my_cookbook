require 'rails_helper'

feature 'User edit a recipe' do
    scenario 'successfully' do
        cake_recipe = Recipe.create!(title: 'Bolo', cook_time: '30', ingredients:'Farinha, açucar, fermento', 
                                cook_method:'Misturar tudo, colocoar no forno por 30 min')
        banana_recipe = Recipe.create!(title: 'Bolo de banana', cook_time: '30', ingredients:'Farinha, açucar, fermento', 
                                cook_method:'Misturar tudo, colocoar no forno por 30 min')
    
        visit root_path
        click_on "Bolo de banana"
        click_on "Deletar"


        expect(current_path).to eq (root_path)
        expect(page).to have_content("Bolo")
        expect(page).not_to have_content("Bolo de banana")

    end



end
