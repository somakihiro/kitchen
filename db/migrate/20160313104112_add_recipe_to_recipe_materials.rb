class AddRecipeToRecipeMaterials < ActiveRecord::Migration
  def change
    add_reference :recipe_materials, :recipe, index: true, foreign_key: true
  end
end
