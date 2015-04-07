class UsersController < ApplicationController

 before_action :authenticate_user!, except: [:show]

 def index
   @users = User.top_rated.paginate(page: params[:page], per_page: 10)
 end

 def update
   if current_user.update_attributes(user_params)
     flash[:notice] = "User information updated"  
   else
     flash[:error] = "Invalid user information" 
   end
   redirect_to edit_user_registration_path
 end
 
 def show
   @user = User.find(params[:id])
   @posts = @user.posts.visible_to(current_user)
   @comments = @user.comments
 end
   
private
 
 def user_params
   params.require(:user).permit(:name, :avatar, :email_favorites)
 end

end