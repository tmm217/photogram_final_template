class LikesController < ApplicationController
  def index
    @likes = Like.all.order({ :created_at => :desc })

    render({ :template => "likes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @like = Like.where({:id => the_id }).at(0)

    render({ :template => "likes/show.html.erb" })
  end

  def create
    @like = Like.new
    @like.fan_id = @current_user.id
    @like.photo_id = params.fetch("query_photo_id")

    if @like.valid?
      @like.save

      # Don't need the below anymore because of
      #   :counter_cache => true
      # on the belongs_to in the Like model

      # user = @like.fan
      # user.likes_count = fan.likes_count + 1
      # user.save

      redirect_to("/photos/#{@like.photo_id}", { :notice => "Like created successfully." })
    else
      redirect_to("/photos/#{@like.photo_id}", { :notice => "Like failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @like = Like.where({ :id => the_id }).at(0)

    @like.fan_id = @current_user.id
    @like.photo_id = params.fetch("query_photo_id")

    if @like.valid?
      @like.save
      redirect_to("/likes/#{@like.id}", { :notice => "Like updated successfully."} )
    else
      redirect_to("/likes/#{@like.id}", { :alert => "Like failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @like = Like.where({ :id => the_id }).at(0)

    @like.destroy

    # Don't need the below anymore because of
    #   :counter_cache => true
    # on the belongs_to in the Like model
    
    # user = @like.fan
    # user.likes_count = fan.likes_count - 1
    # user.save

    redirect_to("/photos/#{@like.photo_id}", { :notice => "Like deleted successfully."} )
  end
end
