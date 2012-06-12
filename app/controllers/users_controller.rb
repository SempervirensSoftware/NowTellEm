class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    pending_user = PendingUser.find_by_email(@user.email)

    if (!pending_user || (pending_user.secret != params[:user_secret]))
      redirect_to root_url
      return
    end

    if @user.save
      pending_user.destroy
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to pending_user
    end       
  end  
  
  def show
    # make sure they are logged in
    session_id = session[:user_id]
    if (!session_id)
      redirect_to log_in_url
      return
    end

    # make sure they are accessing their own page
    id = params[:id]
    if (session_id.to_i != id.to_i )
      actual_user = User.find(session_id)
      if actual_user
        redirect_to actual_user
      else
        redirect_to log_out_url
      end
      return
    end
    
    # they are cool. now build the page
    @user = User.find(id)
    @feedbacks = Feedback.find_all_by_email(@user.email)
  end
  
end