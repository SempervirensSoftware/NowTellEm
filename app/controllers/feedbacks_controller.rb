class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end
  
  def create    
      @feedback = Feedback.new(params[:feedback])
      if @feedback.save
        pending_user = PendingUser.find_by_email(@feedback.email)
        user = User.find_by_email(@feedback.email)
        if (!pending_user && !user)
          #this email has never been seen before - create a pending user and send a notification
          PendingUser.create_and_notify(@feedback.email, @feedback.message)
        elsif (!user && pending_user)
          #pending user exists but user does not, ie this user has never logged in
          PendingUser.notify_pending_user(pending_user.email,@feedback.message,pending_user.secret)
        else
          #user exists (has logged in)
          PendingUser.notify_user(user.email,@feedback.message,user.id)
        end
        redirect_to @feedback
      else
        render 'new'
      end
  end
  
  def show
    @feedback = Feedback.find(params[:id])    
  end

end
