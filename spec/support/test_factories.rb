module TestFactories

 def associated_post(options={})

  post_options = {
      title: 'Post title',
      body: 'Post bodies must be pretty long.',
      topic: Topic.create(name: 'Topic name'),
      user: authenticated_user
                  }.merge(options)

   Post.create(post_options)
  end

 def authenticated_user(options={})
   user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
   user = User.new(user_options)
   user.skip_confirmation!
   user.save
   user
 end

 def comment_without_email
   @user = authenticated_user
   @post = associated_post(user: @user)
   @comment = Comment.new(user: @user, body: "A Comment", post: @post)
    allow(@comment).to receive(:send_favorite_emails)
   @comment.save
 end

end