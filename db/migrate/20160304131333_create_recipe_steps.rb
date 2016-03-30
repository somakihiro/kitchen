class CreateRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipe_steps do |t|
      t.text :step

      t.timestamps null: false
    end
  end
end
