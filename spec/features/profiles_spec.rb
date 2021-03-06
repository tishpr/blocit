 require 'rails_helper'

describe "Visiting profiles" do
 #include TestFactories
  include  Warden::Test::Helpers
            Warden.test_mode!

  before do
   @user = authenticated_user
   @post = associated_post(user: @user)
   @comment = Comment.new(user: @user, body: "A Comment", post: @post)
   allow(@comment).to receive(:send_favorite_emails)
   @comment.save
  end

  describe "not signed in" do

    it "shows profile" do
      comment_without_email
    end
  end

  before do
    login_as(@user, :scope => :user)
  end

  describe "signed in" do

    it "shows profile" do
      comment_without_email
    end
  end


end