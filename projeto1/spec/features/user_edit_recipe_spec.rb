require 'rails_helper'

feature 'User edit a recipe' do
    scenario 'successfully' do
        recipe = Recipe.create!(title: 'Bolo', cook_time: '30', ingredients:'Farinha, açucar, fermento', 
                                cook_method:'Misturar tudo, colocoar no forno por 30 min')
        visit root_path
        click_on "Bolo"
        click_on "Editar"

        fill_in 'Título', with: 'Bolo de cenoura'
        fill_in 'Tempo de Preparo', with: '45'
        fill_in 'Ingredientes', with: 'Cenoura, farinha, ovo, oleo de soja e chocolate'
        fill_in 'Modo de Preparo', with: 'Faça um bolo e uma cobertura de chocolate'

        click_on 'Enviar'

        expect(current_path).to eq (recipe_path(recipe.id))
        expect(page).to have_content("Bolo de cenoura")
        expect(page).to have_content("Voltar")
        expect(page).to have_content("Editar")

    end



end
