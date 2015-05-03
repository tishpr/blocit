require 'rails_helper'
 
 describe Comment do
   #include TestFactories 
 describe "after_create" do
   before do
    @user1 = create(:user)
     @post = create(:post, user: @user1)
     @comment = create(:comment, user: @user1, post: post)
   end

 context "with user's permission" do

 it "sends an email to users who have favorited the post" do
   @user1.favorites.where(post: @post).create 
   allow( FavoriteMailer )
    .to receive(:new_comment)
    .with(@user, @post, @comment)
    .and_return( double(deliver_now: true) )

   @comment.save
  end
 end
 
  context "without permission" do
 
   before { @user1.update_attribute(:email_favorites, false) }

   it "does not send emails, even to users who have favorited" do
     @user1.favorites.where(post: @post).create

     expect( FavoriteMailer )
       .not_to receive(:new_comment)

     @comment.save
     end
   end
 end
end