require 'rails_helper'
 include TestFactories

 describe User do
   
    before do
      @another_not_favorite_post = associated_post
      @favorite_post = associated_post
      @user = authenticated_user
      @favorite = Favorite.create(post_id: @favorite_post.id, user_id: @user.id)
      @not_favorite = associated_post

    end
    describe "#favorited(post)" do
    it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorited(@not_favorite) ).to eq(nil)
    end

    it "returns the appropriate favorite if it exists" do
      expect( @user.favorited(@favorite_post)).to eq(@favorite)
    end

    it "returns `nil` if the user has favorited another post" do
      expect( @user.favorited(@another_not_favorite_post)).to eq(nil)
    end
   end


   describe ".top_rated" do
 
     before do
       @user1 = create(:user)
       post = create(:post, user: @user1)
       create(:comment, user: @user1, post: post)
 
       @user2 = create(:user)
       post = create(:post, user: @user2)
       2.times { create(:comment, user: @user2, post: post) }
     end
 
     it "returns users ordered by comments + posts" do
       expect( User.top_rated ).to eq([@user2, @user1])
     end
 
     it "stores a `posts_count` on user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
     end
 
     it "stores a `comments_count` on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)
     end
   end
 end

 # creating common objects in a before block inside of describe "#favorited(post)"




 