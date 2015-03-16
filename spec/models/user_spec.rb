require 'rails_helper'
 
 describe User do
 
   include TestFactories
 
   describe "#favorited(post)" do
    before do
      @another_not_favorite_post = associated_post
      @favorite_post = associated_post
      @user = authenticated_user
      @favorite = Favorite.create(post_id: @favorite_post.id, user_id: @user.id)
      @not_favorite = associated_post

    end

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
 end

 # creating common objects in a before block inside of describe "#favorited(post)"