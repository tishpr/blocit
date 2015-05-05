require 'rails_helper'
 describe User do
   
    before do
      @another_not_favorite_post = create(:user_with_post_and_comment).posts.first
      @favorite_post = create(:user_with_post_and_comment).posts.first
      @user = create(:user)
      @favorite = Favorite.create(post_id: @favorite_post.id, user_id: @user.id)
      @not_favorite = create(:user_with_post_and_comment).posts.first

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
# last error here ln 32
   describe ".top_rated" do
     before do
       @user1 = create(:user_with_post_and_comment)
       #post = @user1.posts.first

       @user2 = create(:user_with_post_and_comment)
       #post = @user2.posts.first
       create(:comment, user: @user2, post: @user2.posts.first)
     end
 
     it "returns users ordered by comments + posts" do
       expect( [User.top_rated] ).to eq([@user2, @user1])
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




 