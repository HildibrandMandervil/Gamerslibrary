class PostDataController < ApplicationController
  def show
     @book=Book.find(params[:id])
  end

  def index
  end

  def edit
  end
  
  def create
    @post_data = Postdata.new(post_data_params)
    @post_data.user_id = current_user.id
    @post_data.save
    redirect_to post_data_path
  end
  
    private

  def post_data_params
    params.require(:post_data).permit(:title, :image, :body)
  end
end
