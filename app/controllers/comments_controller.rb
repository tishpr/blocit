class CommentsController < ApplicationController
  respond_to :html, :js

   def create

   @post = Post.find(params[:post_id])
   @comment = current_user.comments.new(params.require(:comment).permit(:body))
   @comment.post = @post


   if @comment.save
     flash[:notice] = "Your comment was saved."
     redirect_to [@post.topic, @post]     # expect the user to return to the show view                                          #of the Post they just created.
   else
     flash[:error] = "Snap! There was an error saving the comment. Please try again."
     render :new
    end

   end  

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."    
    else
      flash[:error] = "Comment couldn't be deleted. Try again."     
    end

    respond_with(@comment) do |format|
      format.html{ redirect_to [@post.topic, @post]}
    end
  end

end