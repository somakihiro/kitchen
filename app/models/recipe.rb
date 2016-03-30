class Recipe < ActiveRecord::Base
    has_many :recipe_materials
    accepts_nested_attributes_for :recipe_materials, reject_if: :all_blank, allow_destroy: true
end