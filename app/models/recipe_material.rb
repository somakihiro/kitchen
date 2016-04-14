class RecipeMaterial < ActiveRecord::Base
    belongs_to :recipe
    validates :material, :quantity, presence: true
end
