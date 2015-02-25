require 'rails_helper'
describe Vote do
  describe "validations" do
        before do
       @post = Post.create(title: 'post title', body: 'post body')
       3.times { @post.votes.create(value: 1) }
       2.times { @post.votes.create(value: -1) }
     end
 


    describe "value validation" do
      it "only allows -1 or 1 as values" do
        # your expectations here

        
         #describe '#up_votes' do  
       #it "counts the number of votes with value = 1" do
         #expect( @post.up_votes ).to eq(3)
      # end
     #end

        #up_vote = Vote.new(value: 1)
          #up_vote.valid? #=> true

 
     #describe '#down_votes' do
       #it "counts the number of votes with value = -1" do
         #expect( @post.down_votes ).to eq(2)
     #  end
     #end

        # down_vote = Vote.new(value: -1)
         # down_vote.valid? #=> true
 
     #describe '#points' do
      # it "returns the sum of all down and up votes" do
         #expect( @post.points ).to eq(1) # 3 - 2
       #end
     #end

    # invalid_vote = Vote.new(value: 2)
#invalid_vote.valid? #=> false
      end
    end
  end
end
