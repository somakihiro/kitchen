class RecipePoint < ActiveRecord::Base
    belongs_to :recipe
    validates :point, presence: true
end
