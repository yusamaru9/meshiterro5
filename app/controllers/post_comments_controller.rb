class PostCommentsController < ApplicationController

 def new
   @post_image = PostImege.new
 end 

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end
  
  
  
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
