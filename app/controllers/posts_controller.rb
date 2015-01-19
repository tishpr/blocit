class PostsController < ApplicationController
  #def index
    #@posts = Post.all
    #authorize @posts
    #end

          def show
            @post = Post.find(params[:id])
             @topic = Topic.find(params[:topic_id])
          end

          def new   # instance variable assigned to the return of Post.new related view: posts#new
             @topic = Topic.find(params[:topic_id])
            @post = Post.new
             authorize @post
          end


          def create
                @post = current_user.posts.build(post_params)
                #@post = current_user.posts.build(params.require(:post).permit(:title, :body))
                @topic = Topic.find(params[:topic_id]) 
                @post.topic = @topic
                  #raise   # good to debug with...
                  authorize @post

                   if @post.save
                     flash[:notice] = "Post was saved."
                     redirect_to [@topic, @post]     # expect the user to return to the show view of the Post they just created.

                   else
                     flash[:error] = "There was an error saving the post. Please try again."
                     render :new
                   end

          end


          def edit
            @topic = Topic.find(params[:topic_id])
            @post = Post.find(params[:id])  #defines object
            authorize @post   # authorizing object
          end


          def update

             @post = current_user.posts.build(post_params)
             @topic = Topic.find(params[:topic_id])
             @post = Post.find(params[:id])

             authorize @post  

              if @post.update_attributes(params.require(:post).permit(:title, :body))
               flash[:notice] = "Post was updated."
               redirect_to [@topic, @post]

             else
               flash[:error] = "There was an error saving the post. Please try again."
               render  :edit
             end
             
           end

           private

            def post_params
              params.require(:post).permit(:title, :body)
            end
   
end

