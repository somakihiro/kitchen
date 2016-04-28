class LikesController < ApplicationController
    def create
        @like = current_user.likes.build(recipe_id: params[:recipe_id])
        @like.save
        redirect_to :back
    end
    
    def destroy
        @like = current_user.likes.find_by(recipe_id: params[:id])
        @like.destroy
        redirect_to :back
    end
end