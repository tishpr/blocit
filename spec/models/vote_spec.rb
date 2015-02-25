 require 'rails_helper'

describe Vote do

  describe "validations" do
        before do      #initialized values
          @up_vote = Vote.new(value: 1)
          
          @down_vote = Vote.new(value: -1)
          
          @invalid_vote = Vote.new(value: 2)
       
     end
 end
    #describe "value validation" do
      #it "only allows -1 or 1 as values" do
       
        
         describe '#up_vote' do  
       it "check if vote of one is valid " do
         expect( @up_vote.valid? ).to eq(true) 
       end
     end
 
     describe '#down_vote' do
       it "check if vote of -1 is valid" do
         expect( @down_vote.valid? ).to eq(true)
       end
     end
 
     describe '#invalid_vote' do
       it " check if vote  other than 1 or -1 " do
         expect( @invalid_vote.valid? ).to eq(false) 
       end
     end
  end



