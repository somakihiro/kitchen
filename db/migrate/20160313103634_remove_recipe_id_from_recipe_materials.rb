class RemoveRecipeIdFromRecipeMaterials < ActiveRecord::Migration
  def change
    remove_column :recipe_materials, :recipe_id, :integer
  end
end
