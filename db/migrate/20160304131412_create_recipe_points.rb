class CreateRecipePoints < ActiveRecord::Migration
  def change
    create_table :recipe_points do |t|
      t.string :point

      t.timestamps null: false
    end
  end
end
