class RecipesController < ApplicationController
    
    def index
    end
    
    def new
        @recipe = Recipe.new
        3.times { @recipe.recipe_materials.build }
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.save
        redirect_to new_recipe_path
    end
    
    def recipe_params
        params.require(:recipe).permit(:title, :description, recipe_materials_attributes: [:id, :material, :quantity, :_destroy])
    end
end
