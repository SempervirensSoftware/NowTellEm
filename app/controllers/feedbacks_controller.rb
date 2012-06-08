class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end
  
  def create    
      @feedback = Feedback.new(params[:feedback])
      if @feedback.save
        redirect_to @feedback
      else
        render 'new'
      end
  end
  
  def show
    @feedback = Feedback.find(params[:id])
  end

end
