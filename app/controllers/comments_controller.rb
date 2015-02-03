class CommentsController < ApplicationController

 def create

  @post = Post.find(params[:post_id])
  @comment = current_user.comments.new(params.require(:comment).permit(:body))
  @comment.post = @post


  if @comment.save
   flash[:notice] = "Your comment was saved."
   redirect_to [@post.topic, @post]     # expect the user to return to the show view 
                                            #of the Post they just created.
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
     flash[:notice] = "Comment was removed"
     redirect_to topic_post_url(@post, topic_id: @post.topic.id) #more explicit for nesting 
    else
     flash[:error] = "Comment could not be deleted, try again later"
     redirect_to [@topic, @post]
    end

 end

def can_moderate?(user, record)
  user == record.user || user.role?(:admin) || user.role?(:moderator)
end

end


