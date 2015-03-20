describe Topic do
   describe "scopes" do
 
     before do 
       @public_topic = Topic.create(name: 'Sandy', public: true) # default is public
       @private_topic = Topic.create(name: 'Jimmy', public: false)

     end
 
     describe "publicly_viewable" do
       it "returns a relation of all public topics" do
         expect(Topic.publicly_viewable).to eq( [@public_topic] )
       end
     end
 
     describe "privately_viewable" do
       it "returns a relation of all private topics" do
        expect(Topic.privately_viewable).to eq( [@private_topic] )
         scope :privately_viewable, -> (current_user: true) where(public: 'false')           
       end
     end
 
     describe "visible_to(user)" do
       it "returns all topics if the user is present" do
         user = true # sneaky solution; we don't need a real user, just something truthy
         expect(Topic.publicly_viewable).to eq(public: true)  
         scope :visible_to, -> (user) { where(public: true) }
         end   # Your code here
       end
 
       it "returns only public topics if user is nil" do
        user = nil
        expect(Topic.publicly_viewable).where(user: nil)
    
     end
   end
 end