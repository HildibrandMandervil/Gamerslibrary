class Public::UsersController < ApplicationController
  def index
    @users = User.all
    @post_datum = PostDatum.new
    
  end

  def show
    @user = User.find(params[:id])
    @post_data = @user.post_data
    @post_datum = PostDatum.new
    
  end

  def edit
     @user = User.find(params[:id])
     @minimum_name_length = User.validators_on(:name)[0].options[:minimum]
     @maximum_name_length = User.validators_on(:name)[0].options[:maximum]
     @post_datum = PostDatum.find(params[:id])
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

end
