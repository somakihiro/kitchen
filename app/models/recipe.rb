class Recipe < ActiveRecord::Base
    validates :image, presence: true
    validates :title, presence: true, length: { maximum: 30 }
    validates :description, presence: true, length: { maximum: 60 }
    
    has_many :recipe_materials
    has_many :recipe_steps
    has_many :recipe_points
    
    accepts_nested_attributes_for :recipe_materials, allow_destroy: true
    accepts_nested_attributes_for :recipe_steps, allow_destroy: true
    accepts_nested_attributes_for :recipe_points, reject_if: :all_blank, allow_destroy: true
    
    mount_uploader :image, ImageUploader
end