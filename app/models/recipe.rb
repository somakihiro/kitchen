class Recipe < ActiveRecord::Base
    has_many :recipe_materials
    has_many :recipe_steps
    has_many :recipe_points
    accepts_nested_attributes_for :recipe_materials, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :recipe_steps, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :recipe_points, reject_if: :all_blank, allow_destroy: true
end