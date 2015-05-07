class CommentsController < ApplicationController
  #respond_to :html, :js
   
 def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

      if @comment.save
        flash[:notice] = "Comment was created."
      else
        flash[:error] = "There was an error saving the comment. Please try again."
      end
      respond_to do |format|
        format.html
        format.js
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

   respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end