class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit,:updata,:destroy]
  
  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(7) 
    @new_post = Post.new
    

  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @new_post = Post.new

  end

  def edit
     @user = User.find(params[:id])
     @minimum_name_length = User.validators_on(:name)[0].options[:minimum]
     @maximum_name_length = User.validators_on(:name)[0].options[:maximum]
  end

  def update
      @user =User.find(params[:id])
  if  @user.update(user_params)
      flash[:notice] = "データをセーブしました。"
      redirect_to user_path(@user.id)
  else
      @users = User.all
      render :edit
  end    
  end

  def destroy
     @users=User.all
     user=User.find(params[:id])
     user.delete
     redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :post_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end

end
