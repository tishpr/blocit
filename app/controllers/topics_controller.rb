class TopicsController < ApplicationController

  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = topics.find(params[:id])
    authorize @topic
  end

  def edit
     @topic = Topic.find(params[:id])
     authorize @topic
  end

  def update
    @topic = topic.find(params[:id])
    authorize @topic

       if @topic.update_attributes(params.require(:post).permit(:name, :description, :public))
         flash[:notice] = "Topic was updated."
         redirect_to @post
       else
         flash[:error] = "There was an error saving the Topic. Please try again."
         render :edit
  end
end

  def create
    
    @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
        if @topic.save
          flash[:notice] = "Topic was saved."
          redirect_to @topic      # expect the user to return to the show view of the topic they just created.
        else
            flash[:error] = "There was an error saving the topic. Please try again."
            render :new
         end
  end
end

