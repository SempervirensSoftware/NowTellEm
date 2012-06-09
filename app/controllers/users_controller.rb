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
      redirect_to @user
    else
      redirect_to pending_user
    end       
  end  
  
  def show
    session_id = session[:user_id]
    if (!session_id)
      redirect_to log_in_url
      return
    end

    id = params[:id]
    if (session_id.to_i != id.to_i )
      redirect_to root_url
      return
    end
    
    @user = User.find(id)
    @feedbacks = Feedback.find_all_by_email(@user.email)
  end
  
end