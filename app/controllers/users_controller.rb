class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followers, :followings, :timeline, :like]
  before_action :authenticate, only: [:edit, :update]
  before_action :logged_in_user, only: [:timeline]
  
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @recipes = @user.recipes.order(created_at: :desc)
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "プロフィールを変更しました。"
    else
      render 'edit'
    end
  end
  
  def followers
    @follower_users = @user.follower_users
  end
  
  def followings
    @following_users = @user.following_users
  end
  
  def timeline
    if logged_in?
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
  end
  
  def like
    @like_recipes = current_user.like_recipes.order(created_at: :desc)
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction, :image, :image_cache)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def authenticate
    redirect_to root_url unless @user == current_user
  end
  
end
