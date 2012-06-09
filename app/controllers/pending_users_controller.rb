class PendingUsersController < ApplicationController

  def new
    @pending_user = PendingUser.new
  end

  def show
    pending_user = PendingUser.find_by_secret(params[:secret])
    if (!pending_user)
      redirect_to root_url
      return
    end
    
    @user = User.find_by_email(pending_user.email)
    if @user
      pending_user.destroy
      redirect_to @user
    else
      @user = User.new
      @user.email = pending_user.email
      @secret = pending_user.secret
    end
  end
  
  
end
