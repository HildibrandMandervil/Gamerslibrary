class Public::PostDataController < ApplicationController
  def show
    @post_datum= PostDatum.new
    @datum =PostDatum.find(params[:id])
    @user=@datum.user
  end

  def index
    @post_data = PostDatum.all
  end

  def edit
     @post_datum=PostDatum.find(params[:id])
  end
  
  def create
    @post_datum = PostDatum.new(post_data_params)
    @post_datum.user_id = current_user.id
    @post_datum.save
    redirect_to post_data_path
  end
  
 def update
      post_datum =PostDatum.find(params[:id])
  if  post_datum.update(post_data_params)
      flash[:notice] = "セーブしました."
      redirect_to post_datum_path(post_datum.id)
  else
      @post_datun=post_datum
      render :edit
  end
 end
    private

  def post_data_params
    params.require(:post_datum).permit(:title, :image, :body)
  end
end
