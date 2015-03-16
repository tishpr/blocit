class FavoritesController < ApplicationController

 def create
   @post = Post.find(params[:post_id])
   favorite = current_user.favorites.build(post: @post)
    authorize favorite

    if favorite.save
     # Add code to generate a success flash and redirect to @post
     flash[:notice] = "Your favorite was saved."
     
       # Remember the path shortcut: 
    else
       flash[:notice] = "Oh snap! Your favorite was not saved. Try again."
       
       # Add code to generate a failure flash and redirect to @post
    end
     redirect_to [@post.topic, @post]
    end

 def destroy
   @post = Post.find(params[:post_id])
   # Get the post from the params
   favorite = Favorite.find_by(post_id: @post, user_id: current_user)
   #favorite = current_user.favorited(@post)     #this worked also
    authorize favorite
  
   if favorite.destroy
    flash[:notice] = "Your favorite was removed."
   else
    flash[:notice] = "There was an error removing your favorite."
   end
   redirect_to [@post.topic, @post]
   #redirect_to [@post]
   #redirect_to [@topic, @post]    #why don't these work?
 end

end
