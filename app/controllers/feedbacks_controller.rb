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
        redirect_to confirmation_path(@feedback.id)
      else
        render 'new'
      end
  end
  
  def confirm
     @feedback = Feedback.find(params[:id])    
      if (@feedback)
        @comments = @feedback.comments
      end
  end
  
  def show
    @feedback = Feedback.find(params[:id])    
    if (@feedback)
      @comments = @feedback.comments
    end
  end
  
  def edit
    session_id = session[:user_id]
    
    # make sure they are logged in
    if (!session_id)
      redirect_to log_in_url
      return
    end

    @feedback = Feedback.find(params[:id])
    user = User.find(session_id)

    # make sure they are accessing their own feedback
    if (@feedback.email != user.email )
      if user
        redirect_to user
      else
        redirect_to log_out_url
      end
      return
    end
    
    @comment = @feedback.comments.create
    
  end
  
  def update
    @feedback = Feedback.find(params[:id])
    @feedback.update_attributes(params[:feedback])
    redirect_to confirmation_path(@feedback.id)
  end
end
