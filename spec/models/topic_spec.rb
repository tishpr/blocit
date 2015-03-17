describe Topic do
   describe "scopes" do
 
     before do 
       @public_topic = Topic.create # default is public
       @private_topic = Topic.create(public: false)

     end
 
     describe "publicly_viewable" do
       it "returns a relation of all public topics" do
         expect(Topic.publicly_viewable).to eq( [@public_topic] )
         scope :publicly_viewable -> where(public: true) }
      
     end
     end
 
     describe "privately_viewable" do
       it "returns a relation of all private topics" do
        expect(Topic.publicly_viewable).to eq( [@private_topic] )
         scope :privately_viewable -> { where(public: false) }          
       end
     end
 
     describe "visible_to(user)" do
       it "returns all topics if the user is present" do
         user = true # sneaky solution; we don't need a real user, just something truthy
         expect(Topic.publicly_viewable), public: true) 
         scope :visible_to, -> {where(user: true, public: true)}
         end   # Your code here
       end
 
       it "returns only public topics if user is nil" do
        user = nil
        expect(Topic.publicly_viewable).where(user: nil)
      end
        user = nil
         @public_topic.publicly_viewable.where(user)      # Your code here
       end
     end
   end
 end