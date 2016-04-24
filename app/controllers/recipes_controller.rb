class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :logged_in_user, only: [:new, :create, :edit, :update]
    def index
    end
    
    def show
    end
    
    def new
        @recipe = Recipe.new
        3.times { @recipe.recipe_materials.build }
        4.times { @recipe.recipe_steps.build }
        @recipe.recipe_points.build
    end
    
    def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            flash[:success] = "投稿に成功しました"
            redirect_to @recipe
        else
            render 'new'
        end
    end
    
    def edit
    end
     
    def update
        if @recipe.update(recipe_params)
            redirect_to recipe_path, notice: "レシピを変更しました。"
        else
            render 'edit'
        end
    end
    
    def destroy
        @recipe.destroy
        redirect_to root_path
    end
    
    def recipe_params
        params.require(:recipe).permit(:title, :description, :image, :image_cache, recipe_materials_attributes: [:id, :material, :quantity, :_destroy], recipe_steps_attributes: [:id, :step, :_destroy], recipe_points_attributes: [:id, :point, :_destroy])
    end
    
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
end