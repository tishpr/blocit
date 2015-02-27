
require 'rails_helper'

RSpec.describe Vote, type: :model do
  
  describe "validations" do

    describe "value validation" 
      
      before do
        @up_vote = Vote.new(value: 1)
        @down_vote = Vote.new(value: -1)
        @invalid_vote = Vote.new(value: 2)
      end

      it "only allows -1 or 1 as values" do
       
      expect( @up_vote.valid? ).to eq( true )
      expect( @down_vote.valid? ).to eq( true )
      expect( @invalid_vote.valid? ).to eq( false )
      end
 
    end

end




