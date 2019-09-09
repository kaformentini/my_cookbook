require 'rails_helper'

feature 'user register a recipe' do
    scenario 'successffuly' do
        visit root_path
        click_on "Adicionar uma receita"

        fill_in "Título", with: "Bolo"
        fill_in "Tempo de Preparo", with: "30"
        fill_in "Ingredientes", with: "Farinha, açucar, fermento"
        fill_in "Modo de Preparo", with: "Misturar tudo, colocoar no forno por 30 min"

        click_on "Enviar"

        
        expect(page).to have_content("Receita cadastrada com sucesso!")
        expect(page).to have_content("Bolo")
        expect(page).to have_content("30")
        expect(page).to have_content("Farinha, açucar, fermento")
        expect(page).to have_content("Misturar tudo, colocoar no forno por 30 min")
        
    end
    scenario 'user see recipe' do

        recipe = Recipe.create!(title: 'Bolo', cook_time: '30', ingredients:'Farinha, açucar, fermento', 
                                cook_method:'Misturar tudo, colocoar no forno por 30 min')
        visit root_path
        click_on "Bolo"

        expect(current_path).to eq (recipe_path(recipe.id))
        expect(page).to have_content("Bolo")
        expect(page).to have_content("30")
        expect(page).to have_content("Farinha, açucar, fermento")
        expect(page).to have_content("Misturar tudo, colocoar no forno por 30 min")
        expect(page).to have_content("Voltar")

    end

    scenario 'and come back to root path' do

        recipe = Recipe.create!(title: 'Bolo', cook_time: '30', ingredients:'Farinha, açucar, fermento', 
                                cook_method:'Misturar tudo, colocoar no forno por 30 min')
        visit root_path
        click_on "Bolo"
        click_on "Voltar"

        expect(current_path).to eq (root_path)
    end


end
