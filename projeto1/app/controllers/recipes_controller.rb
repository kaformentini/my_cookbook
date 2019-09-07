class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            #byebug
            flash[:notice] = "Receita cadastrada com sucesso!"
            redirect_to @recipe
        else
            
        end
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

private
    def recipe_params
        params.require(:recipe).permit(:title, :cook_time, :ingredients, :cook_method)
    end
end
