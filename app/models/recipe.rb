class Recipe < ActiveRecord::Base
    validates :image, :title, :description, presence: true
    
    has_many :recipe_materials
    has_many :recipe_steps
    has_many :recipe_points
    
    accepts_nested_attributes_for :recipe_materials, allow_destroy: true
    accepts_nested_attributes_for :recipe_steps, allow_destroy: true
    accepts_nested_attributes_for :recipe_points, reject_if: :all_blank, allow_destroy: true
    
    mount_uploader :image, ImageUploader
end