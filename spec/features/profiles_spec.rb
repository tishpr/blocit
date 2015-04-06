 require 'rails_helper'

describe "Visiting profiles" do

  include TestFactories
  include  Warden::Test::Helpers
            Warden.test_mode!

  before do
    comment_without_email
  end

  describe "not signed in" do

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
    end
  end

  before do
    comment_without_email
    login_as(@user, :scope => :user)
  end

  describe "signed in" do

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
    end
  end


end