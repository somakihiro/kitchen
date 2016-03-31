class CreateRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipe_steps do |t|
      t.text :step
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
