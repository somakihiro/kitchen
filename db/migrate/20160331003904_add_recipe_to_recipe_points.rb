class AddRecipeToRecipePoints < ActiveRecord::Migration
  def change
    add_reference :recipe_points, :recipe, index: true, foreign_key: true
  end
end
