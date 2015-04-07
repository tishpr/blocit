class Topics::PostsController < ApplicationController
 #  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]:destroy

 def index
 end


  def show
    @topic = Topic.find(params[:topic_id])
    authorize @topic     # authorize here so don't show a post of a private topic 
    @post = Post.find(params[:id]) 
    @comments = @post.comments
  end

  def new   # instance variable assigned to the return of Post.new related view: posts#new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
     authorize @post
   end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)  
    @post.topic = @topic   
    authorize @post
    @post.save_with_initial_vote
    if @post.votes(:value == 1) # This fixed the problem of error msg in wrong place
     flash[:notice] = "Post was saved."
     redirect_to [@topic, @post]     # expect the user to return to the show view of the Post they just created.
       
    else
     flash[:error] = "Snap! There was an error saving the post. Please try again."
     render :new
     end
  end
          

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])  #defines object
    authorize @post   # authorizing object
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post  

    if @post.update_attributes(post_params)
     flash[:notice] = "Post was updated."
     redirect_to [@topic, @post]

   else
     flash[:error] = "Snap! There was an error saving the post. Please try again."
     render  :edit
   end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    title = @post.title
    authorize @post
 
   if @post.destroy
     flash[:notice] = "\"#{title}\" was deleted successfully."
     redirect_to @topic
   else
     flash[:error] = "There was an error deleting the post."
     render :show
   end
  end



 private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
   
end

