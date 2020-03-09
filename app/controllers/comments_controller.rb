class CommentsController < ApplicationController
  def create
    comment = Comment.new

    comment.author_id = @current_user.id
    comment.photo_id = params.fetch(:query_photo_id)
    comment.body = params.fetch(:query_body)
    
    comment.save

    # Don't need the below anymore because of
    #   :counter_cache => true
    # on the belongs_to in the Comment model

    # user = comment.commenter
    # user.comments_count = user.comments_count + 1
    # user.save
    
    redirect_to("/photos/#{comment.photo_id}")
  end

end
