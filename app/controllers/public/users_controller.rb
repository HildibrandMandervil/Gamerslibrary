class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @post_datas = @user.post_datas
  end

  def edit
     @user = User.find(params[:id])
  end
end
