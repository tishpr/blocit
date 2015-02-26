require 'rails_helper'

describe Vote do
  

  describe "validations" do

    describe "value validation" 
      
      before do
        @up_vote = Vote.new(value: 1)
        @down_vote = Vote.new(value: -1)
        @invalid_vote = Vote.new(value: 2)
      end

      it "only allows -1 or 1 as values" do
       
      expect( @up_vote ).to eq( true )
      expect( @down_vote ).to eq( true )
      expect( @invalid_vote ).to eq( false )
      end

      
    end
  end





#








