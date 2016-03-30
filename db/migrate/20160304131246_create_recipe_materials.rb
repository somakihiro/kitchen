class CreateRecipeMaterials < ActiveRecord::Migration
  def change
    create_table :recipe_materials do |t|
      t.string :material, foregin_key: true
      t.string :quantity, foregin_key: true

      t.timestamps null: false
    end
  end
end
