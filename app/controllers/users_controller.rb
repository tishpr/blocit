class UsersController < ApplicationController
   before_action :authenticate_user!
 
   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       
     else
       flash[:error] = "Invalid user information"
       
     end
     redirect_to edit_user_registration_path
end
 

 
   private
 
   def user_params
     params.require(:user).permit(:name, :avatar, :email_favorites)
   end



 end