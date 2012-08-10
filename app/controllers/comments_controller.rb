class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(params[:comment])
    if (@comment.save)
      @feedback = Feedback.find(@comment.feedback_id)
      redirect_to @feedback
    end    
  end
  
end